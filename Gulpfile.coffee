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
glob     = require 'glob'
gulp     = require 'gulp'
coffee   = require 'gulp-coffee'
concat   = require 'gulp-concat'
connect  = require 'gulp-connect'
del      = require 'del'
fs       = require 'fs'
htmlmin  = require 'gulp-htmlmin'
imagemin = require 'gulp-imagemin'
markdown = require('markdown').markdown
mustache = require 'mustache'
pages    = require 'gulp-gh-pages'
rename   = require 'gulp-rename'
stylus   = require 'gulp-stylus'
through  = require 'through2'
yaml     = require 'js-yaml'

options =
  src: 'src'
  dist: 'dist'

archive_list = []

render = (content) ->
  template = fs.readFileSync("#{options.src}/app.mustache", 'utf8')
  new Buffer mustache.render template, {}, content: content

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
      chunk.contents = render fs.readFileSync chunk.path, 'utf8'
      this.push chunk
      callback null, chunk
    .pipe htmlmin collapseWhitespace: true
    .pipe gulp.dest options.dist

gulp.task 'buildMarkdown', ['clean'], ->
  gulp.src "#{options.src}/posts/**md"
    .pipe through.obj (chunk, enc, callback) ->
      post = fs.readFileSync(chunk.path, 'utf8').split('+++')
      meta = yaml.load(post[0]); content = post[1]
      meta['endpoint'] = chunk.path.replace('.md', '.html').split('/').slice(-1)[0].split('-').slice(1).join('-')
      date = chunk.path.split('-')[0].split('/').slice(-1)[0]
      meta['date'] = "#{date.substring(0, 4)}-#{date.substring(4, 6)}-#{date.substring(6, 8)}"
      chunk.contents = render markdown.toHTML content
      path = chunk.path.replace('.md', '.html')
      chunk.path = chunk.path.replace('.md', '.html').replace(date + '-', '')
      this.push chunk
      archive_list.push meta
      callback null, chunk
    .pipe htmlmin collapseWhitespace: true
    .pipe gulp.dest "#{options.dist}/blog"

gulp.task 'buildBlog', ['buildMarkdown'], ->
  index = ""
  fs.readdir "#{options.src}/posts/", (err, files) ->
    for file in files.reverse()[0..2]
      do (file) ->
        post = fs.readFileSync("#{options.src}/posts/#{file}", 'utf8').split('+++')[1]
        index += markdown.toHTML post
        index += '<hr />'
    fs.mkdirSync("#{options.dist}/blog") unless fs.existsSync("#{options.dist}/blog")
    fs.writeFile "#{options.dist}/blog/index.html", render renderBlogIndex(index).toString()

  archive_list = archive_list.reverse()
  archive = ""
  for meta in archive_list
    do (meta) ->
      archive += "<p class='searchable'><strong>#{meta.date}</strong> <a href='/blog/#{meta.endpoint}'>#{meta.title}</a></p>"
  fs.mkdirSync("#{options.dist}/blog") unless fs.existsSync("#{options.dist}/blog")
  fs.writeFile "#{options.dist}/blog/archive.html", render renderBlog(archive).toString()

gulp.task 'buildSitemap', ['clean', 'misc', 'buildAssets', 'buildStylus', 'buildCoffee', 'buildMarkup', 'buildBlog'], ->
  stamp = new Date()
  sitemap_list = "<url><loc>http://www.syrinx.com/</loc><lastmod>#{stamp}</lastmod></url>"
  glob "#{options.dist}/**/*.html", (err, files) ->
    for file in files
      do (file) ->
        file = file.replace('dist/', 'https://www.syrinx.com/')
        sitemap_list += "<url><loc>#{file}</loc><lastmod>#{stamp}</lastmod></url>"
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
