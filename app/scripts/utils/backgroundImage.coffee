define (require, exports, module)->
  backgroundImage = ($el, url, args...)->
    if _.isString(args[0])
      defaultUrl = args[0]
      callback = args[1]
    else
      callback = args[0]

    defaultSrc = if !!defaultUrl then "url(#{defaultUrl})" else ''
    url = '' unless url?
    src = if !!url then "url(#{url})" else ''

    $el.addClass 'imgload'
    $el.removeClass 'load'
    $el.css 'willChange', 'opacity'
    img = new Image

    img.onload = ->
      $el.addClass 'load'
      $el.css 'background-image': src
      callback? null, $el, url, defaultUrl, img
      $el.css 'willChange', 'initial'
    img.onerror = ->
      if defaultSrc
        backgroundImage $el, defaultUrl, callback
      else
        $el.addClass 'load'
        $el.css 'background-image': url
        callback? 'error', $el, url, defaultUrl, img
        $el.css 'willChange', 'initial'

    img.src = url