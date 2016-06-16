define (require, exports, module)->
  _List = require '../_List'
  NewsItem = require '../NewsItem/NewsItem'
  NewsCollection = require 'collection/NewsCollection'

  ListModel = Backbone.Epoxy.Model.extend
    defaults:
      page: 0
      per: 5
      total_pages: ''
      last_page: false

  NewsList = _List.extend
    template: '#NewsList'
    className: 'news_list'
    itemView: NewsItem

    ui:
      list: '[data-js-list]'
      more: '[data-js-more-btn]'
    
    bindings:
      # ':el': 'collection: $collection'
      '@ui.list': 'collection: $collection'
      '@ui.more': 'more:last_page'

    bindingHandlers:
      more: ($el, val) ->
        if val
          $el.addClass 'hidden'
        else
          $el.removeClass 'hidden'

    events:
      'click @ui.more': 'onClickMore'

    initialize: ->
      @model = new ListModel
      @collection ?= new NewsCollection
      @getNews()
      #@collection.view = @itemView #if use backbone.epoxy < 1.2
    
    getNews: ->
      @collection.refresh(@model.toJSON()).done (data) =>
        @onSetTotalPages(data)

    onClickMore: (e) ->
      @model.set {page: @model.get('page')+1}
      @getNews()

    onSetTotalPages: (data) ->
      @model.set {total_pages: data.total_pages}
      @checkLastPage()

    checkLastPage: ->
      if @model.get('page') is @model.get('total_pages')
        @model.set {last_page: true}
      else
        @model.set {last_page: false}