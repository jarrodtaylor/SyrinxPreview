classify = ->
  path = window.location.pathname.split('/')[1]
  document.getElementsByTagName('body')[0].className = path or 'home'

toggleNav = (event) ->
  event.preventDefault()
  nav = document.getElementsByTagName('nav')[0]
  if nav.className == 'show' then nav.className = '' else nav.className = 'show'

filterPosts = ->
  console.log 'filtering'
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
