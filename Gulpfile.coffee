# Public: Build, run, and deploy the site with Gulp.
#
# Examples
#
#   ~/syrinx $ gulp
#   # => Builds the site to dist/ and runs it on localhost:8080.
#   # => Watches src/ for changes, then rebuilds and reloads.
#
#   ~/syrinx $ gulp deploy
#   # => Deploys the dist/ directory to Github Pages.
fm       = require 'front-matter'
glob     = require 'glob'
gulp     = require 'gulp'
coffee   = require 'gulp-coffee'
concat   = require 'gulp-concat'
connect  = require 'gulp-connect'
del      = require 'del'
fs       = require 'fs'
path     = require 'path'
htmlmin  = require 'gulp-htmlmin'
imagemin = require 'gulp-imagemin'
markdown = require('markdown').markdown
mustache = require 'mustache'
pages    = require 'gulp-gh-pages'
rename   = require 'gulp-rename'
stylus   = require 'gulp-stylus'
through  = require 'through2'

options =
  src: 'src'
  dist: 'dist',
  default_title: 'Syrinx',
  base_url: 'http://www.syrinx.com/'

archive_list = []

merge = (xs...) ->
  if xs?.length > 0
    tap {}, (m) -> m[k] = v for k, v of x for x in xs

tap = (o, fn) -> fn(o); o

toTitleCase = (str) ->
  str.replace /\w\S*/g, (txt) ->
    txt[0].toUpperCase() + txt[1..txt.length - 1].toLowerCase()

render = (content, data) ->
  data = data || {}
  template = fs.readFileSync("#{options.src}/app.mustache", 'utf8')
  new Buffer mustache.render template, data, content: content

renderBlog = (content) ->
  template = fs.readFileSync("#{options.src}/blog.mustache", 'utf8')
  new Buffer mustache.render template, {}, content: content

renderBlogIndex = (content) ->
  template = fs.readFileSync("#{options.src}/blogIndex.mustache", 'utf8')
  new Buffer mustache.render template, {}, content: content

renderSitemap = (content) ->
  template = fs.readFileSync("#{options.src}/sitemap.xml", 'utf8')
  new Buffer mustache.render template, {}, content: content

gulp.task 'clean', -> del options.dist

gulp.task 'misc', ['clean'], ->
  gulp.src("#{options.src}/CNAME").pipe gulp.dest(options.dist)
  gulp.src("#{options.src}/googlee887f98b5ed76460.html").pipe gulp.dest(options.dist)
  gulp.src("#{options.src}/robots.txt").pipe gulp.dest(options.dist)

gulp.task 'buildAssets', ['clean', 'buildOptimizedImages'], ->
  gulp.src ["#{options.src}/assets/**/*", "!#{options.src}/assets/img/**/*"]
    .pipe gulp.dest "#{options.dist}/assets"

gulp.task 'buildStylus', ['clean'], ->
  gulp.src "#{options.src}/app.styl"
    .pipe stylus compress: true
    .pipe gulp.dest options.dist

gulp.task 'buildCoffee', ['clean'], ->
  gulp.src "#{options.src}/**/*coffee"
    .pipe concat 'app.js'
    .pipe coffee bare: true
    .pipe gulp.dest options.dist

gulp.task 'buildMarkup', ['clean'], ->
  gulp.src "#{options.src}/templates/**/*html"
    .pipe through.obj (chunk, enc, callback) ->
      relative = chunk.relative.replace /[\/\\]/g, '/'
      dirname = path.dirname relative
      basename = path.basename relative

      if basename == 'index.html' && relative.indexOf(basename) != 0
        title = dirname.replace(/-/g, ' ').trim()
      else
        title = basename.replace('.html','').replace(/-/g, ' ').trim()

      if title && title.length > 0
        title = toTitleCase(title) + ' | Syrinx'

      data = fm String(chunk.contents)
      meta = {}
      meta._file = basename
      meta.title = title || options.default_title
      meta.endpoint = relative
      meta.canonical = options.base_url + meta.endpoint
      
      if basename == 'index.html' && relative.indexOf(basename) != 0
        meta.canonical = options.base_url + dirname + '/'
      else if relative == 'index.html'
        meta.canonical = options.base_url
        
      meta = merge meta, data.attributes
      chunk.contents = render data.body, meta
      this.push chunk
      callback null
    .pipe htmlmin collapseWhitespace: true
    .pipe gulp.dest options.dist

gulp.task 'buildMarkdown', ['clean'], ->
  gulp.src "#{options.src}/posts/**md"
    .pipe through.obj (chunk, enc, callback) ->
      basename = path.basename chunk.path
      title = basename.replace('.md','').split('-').slice(1).join(' ').trim()

      if title && title.length > 0
        title = toTitleCase(title) + ' | Syrinx Blog'

      data = fm String(chunk.contents)
      meta = {}
      meta._file = basename
      meta.title = title || options.default_title
      meta.endpoint = basename.replace('.md', '.html').split('-').slice(1).join('-').toLowerCase()
      meta.canonical = options.base_url + 'blog/' + meta.endpoint
      date = basename.split('-')[0]
      meta.date = "#{date.substring(0, 4)}-#{date.substring(4, 6)}-#{date.substring(6, 8)}"
      meta = merge meta, data.attributes
      chunk.contents = render markdown.toHTML(data.body), meta
      this.push chunk
      archive_list.push meta
      callback null
    .pipe rename (filepath) ->
      filepath.basename = filepath.basename.split('-').slice(1).join('-').toLowerCase()
      filepath.extname = ".html"
    .pipe htmlmin collapseWhitespace: true
    .pipe gulp.dest "#{options.dist}/blog"

gulp.task 'buildBlog', ['buildMarkdown'], ->
  index = ""
  meta_blog = { title: 'Syrinx Blog', canonical: options.base_url + 'blog/' }
  fs.readdir "#{options.src}/posts/", (err, files) ->
    for file in files.reverse()[0..2]
      do (file) ->
        contents = fs.readFileSync("#{options.src}/posts/#{file}", 'utf8')
        data = fm String(contents)
        if data.body && data.body.length > 0
          data.body = data.body.split('+++')[1]
        index += markdown.toHTML data.body
        index += '<hr />'
    fs.mkdirSync("#{options.dist}/blog") unless fs.existsSync("#{options.dist}/blog")
    fs.writeFile "#{options.dist}/blog/index.html", render renderBlogIndex(index).toString(), meta_blog
  
  meta_blog_archives = { title: 'Syrinx Blog Archives', canonical: options.base_url + 'blog/archive.html' }
  archive_list = archive_list.reverse()
  archive = ""
  for meta in archive_list
    do (meta) ->
      archive += "<p class='searchable'><strong>#{meta.date}</strong> <a href='/blog/#{meta.endpoint}'>#{meta.title}</a></p>"
  fs.mkdirSync("#{options.dist}/blog") unless fs.existsSync("#{options.dist}/blog")
  fs.writeFile "#{options.dist}/blog/archive.html", render renderBlog(archive).toString(), meta_blog_archives

gulp.task 'buildSitemap', ['clean', 'misc', 'buildAssets', 'buildStylus', 'buildCoffee', 'buildMarkup', 'buildBlog'], ->
  lastmod = new Date().toISOString()
  sitemap_list = "<url><loc>http://www.syrinx.com/</loc><lastmod>#{lastmod}</lastmod></url>"
  glob "#{options.dist}/**/*.html", (err, files) ->
    for file in files
      do (file) ->
        relative = file.replace /[\/\\]/g, '/'
        relative = relative.replace 'dist/', ''
        dirname = path.dirname relative
        basename = path.basename relative
        canonical = options.base_url + relative
        
        if relative == '404.html'
          return
        else if relative == 'notfound/index.html'
          return
        else if relative == 'googlee887f98b5ed76460.html'
          return
        else if relative == 'index.html'
          return
          
        if basename == 'index.html' && relative.indexOf(basename) != 0
          canonical = options.base_url + dirname + '/'
        else if basename == 'index.html'
          canonical = options.base_url

        sitemap_list += "<url><loc>#{canonical}</loc><lastmod>#{lastmod}</lastmod></url>"
    fs.writeFile "#{options.dist}/sitemap.xml", renderSitemap(sitemap_list).toString()

gulp.task 'buildOptimizedImages', [], ->
  gulp.src "#{options.src}/assets/img/**/*"
    .pipe imagemin()
    .pipe gulp.dest "#{options.dist}/assets/img"

gulp.task 'build', ['misc', 'buildAssets', 'buildStylus', 'buildCoffee', 'buildMarkup', 'buildBlog', 'buildSitemap']

gulp.task 'connect', -> connect.server root: options.dist, livereload: true

gulp.task 'reload', ['build'], -> gulp.src(options.dist).pipe connect.reload()

gulp.task 'watch', -> gulp.watch "#{options.src}/**/*", ['build', 'reload']

gulp.task 'default', ['build'], ->
  gulp.start 'watch'
  gulp.start 'connect'

# When deploying to a user or org page:
#   Set branch to 'master'
#   Develop on a non-'master' branch
# When deploying to a project page:
#   Set branch to 'gh-pages' (default)
gulp.task 'deploy', ['build'], ->
  gulp.src "#{options.dist}/**/*"
    .pipe pages branch: 'master'
