define (require, exports, module)->
  _Page = require './_Page'
  common = require 'common'
  _ = require 'underscore'
  Backbone = require 'backbone'

  _AnimationPage = _Page.extend

    showAnimation: (callback) ->
      @$el.css 'display', 'block'
      _.delay =>
        @$el.addClass 'show-page'
        callback?()
      , 400

    closeAnimation: (callback) ->
      @$el.removeClass('show-page').css('display', 'none')
      callback?()
