define (require, exports, module)->
  Backbone = require 'backbone'
  NewsModel = require 'model/NewsModel'

  NewsCollection = Backbone.Collection.extend
    model: NewsModel

    refresh: (obj) ->
      async = $.Deferred()
      common.api.get_news(obj).done (data) =>
        @add data.news, {parse: true}
        async.resolve data.pager
      async.promise()
