# scrollTopが利用できる要素を検出する関数
scrollableElement = ->
  i = 0
  while i < arguments.length
    el = arguments[i]
    $el = $ el
    if $el.scrollTop() > 0 then return el
    else
      $el.scrollTop 1
      scrollable = $el.scrollTop() > 0
      $el.scrollTop 0
      if scrollable then return el
    i++

  return []

el = scrollableElement 'html', 'body'

$ '.back-to-top'
  .on 'click', (event) ->
    event.preventDefault()
    $ el
      .animate
        scrollTop: 0
      , 250
