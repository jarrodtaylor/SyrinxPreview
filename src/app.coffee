toggleNav = (event) ->
  event.preventDefault()
  nav = document.getElementsByTagName('nav')[0]
  if nav.className == 'show' then nav.className = '' else nav.className = 'show'

filterPosts = ->
  query = document.getElementById('search').value.toLowerCase()
  posts = document.getElementsByClassName('searchable')

  if query.length > 0
    for post in posts
      do (post) ->
        if post.children[1].innerHTML.toLowerCase().indexOf(query) > -1
          post.style.display = 'block'
        else
          post.style.display = 'none'
  else
    for post in posts
      do (post) -> post.style.display = 'block'

insertMarkdown = (from, into) ->
  xhr = new XMLHttpRequest()
  xhr.open('GET', from)
  xhr.onreadystatechange = () ->
    if (xhr.readyState == 4)
      document.getElementById(into).innerHTML = marked(xhr.responseText)
  xhr.send()

if window.deferredInline
  window.deferredInline.forEach (runnable) ->
    runnable()

getUnderservedEpisodeID = () ->
  xhr = new XMLHttpRequest()
  xhr.open('GET', "http://underserved.libsyn.com/")
  xhr.onreadystatechange = () ->
    if (xhr.readyState == 4)
      id = xhr.responseText.match(/id\/(.*?)\/height/g)[0]
        .replace('id/', '')
        .replace('/height', '')
      document.getElementById("underserved-player").setAttribute('src', "//html5-player.libsyn.com/embed/episode/id/#{id}/height/90/theme/custom/thumbnail/yes/direction/backward/render-playlist/no/custom-color/87A93A/")
  xhr.send()

getUnderservedEpisodeTitleAndDescription = () ->
  xhr = new XMLHttpRequest()
  xhr.open('GET', "https://underserved.libsyn.com/rss")
  xhr.onreadystatechange = () ->
    if (xhr.readyState == 4)
      title = xhr.responseText.match(/<itunes:title>(.*?)\<\/itunes:title>/g)[0]
        .replace('<itunes:title>', '')
        .replace('</itunes:title>', '')
      description = xhr.responseText.match(/<description><!\[CDATA\[(.*?)]]><\/description>/g)[1]
        .replace('<description><![CDATA[', '')
        .replace(']]></description>', '')
      document.getElementById("underserved-title").innerHTML = "What's New: Underserved, #{title}"
      document.getElementById("underserved-description").innerHTML = description
  xhr.send()

underserved = document.getElementById("underserved")
if underserved != null
  getUnderservedEpisodeID()
  getUnderservedEpisodeTitleAndDescription()