define (require, exports, module)->
  _List = require '../_List'
  
  NewsItem = _List.extend
    template: '#NewsItem'
    
    className: 'news_item b-news-item'

    ui:
      data: '[data-js-new-data]'
      image: '[data-js-news-img]'
      date: '[data-js-news-date]'
      title: '[data-js-news-title]'
      preview: '[data-js-news-preview]'

    bindings:
      ':el': 'full:image'
      '@ui.date': 'text:date'
      '@ui.title': 'text:title, href: url'
      '@ui.preview': 'text:preview'
      '@ui.image': 'background_image:image'

    bindingHandlers:
      full: ($el, val) ->
        unless val
          $el.addClass 'b-news-item__no-image'