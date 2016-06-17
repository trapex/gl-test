define (require, exports, module)->
  # _Page = require "./_Page"
  _AnimationPage = require './_AnimationPage'
  common = require 'common'
  _ = require 'underscore'
  Backbone = require 'backbone'
  PageScroller = require 'utils/PageScroller'

  $ = Backbone.$
  pagescroller = new PageScroller

  _ScrollPage = _AnimationPage.extend
    EDGE_OF_SCROLLING: 200

    initialize: ->

      # @listenOnResize = _.bind @on_window_resize, this
      # @on "render", =>
      #   @on_window_resize()

      @on 'onShow', =>
        pagescroller.bind @ui_pages, @EDGE_OF_SCROLLING
        pagescroller.checkPassScroll = =>
          @pagescroller_checkPassScroll.apply this, arguments
        # $(window).resize @listenOnResize

      @on 'onClose', ->
        pagescroller.unbind()
        # $(window).off "resize", @listenOnResize

      @ui_pages = @$el.find '[data-route]'
      # @on_window_resize()

    pagescroller_checkPassScroll: ->
      PageScroller::checkPassScroll.apply pagescroller, arguments

    on_window_resize: ->
      # height = $(window).height()
      # lastPage = @ui_pages.length - 1
      # _.each @ui_pages, (page, pageNum)->
      #   $el = $(page)
      #   if lastPage is pageNum
      #     $el.css {"min-height":height}
      #   else
      #     $el.css {height}
      pagescroller.on_scroll()

    scrollTo: (type, callback) ->
      return unless type
      if _.isObject(type)
        $el = type
      else if /^[\.\[#]/.test type
        $el = $(type)
      else
        $el = $("##{type}")
      if $el.attr('data-route-anchor') is 'add'
        # $('body').animate {scrollTop: 0 }, 600
        $(window).scrollTop(0)
      else
        pagescroller.scrollTo $el, callback
