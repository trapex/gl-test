define (require, exports, module)->
  Backbone = require 'backbone'
  require 'epoxy'

  NewsModel = Backbone.Epoxy.Model.extend

    defaults:
      id: 0
      image: ''
      date: ''
      title: ''
      preview: ''

    # parse: (r) ->
    #   r.id = _.uniqueId()
    #   r
