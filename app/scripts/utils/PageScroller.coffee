define [
  'backbone'
  'underscore'
  'utils/ScrollBinder'
  'common'
  'jqueryStellar'
], (Backbone, _, ScrollBinder, common) ->
  $ = Backbone.$

  class PageScroller
    constructor: ->
      @$scrollEl = $('body, html')
      @scrollbinder = new ScrollBinder this, @$scrollEl


    bind: (@pages, @pageEdgeOffset=200) ->
      @__justBinded =  true
      unless @_historyListener?
        @_historyListener = =>
          if /^#!\/[^\/]+\/([^\/]+)\?/.exec(location.hash)
            $section = $("##{RegExp.$1}")
            @scrollTo $section if !!$section.length
      Backbone.history.on 'route', @_historyListener
      @scrollbinder.bind @on_scroll

    unbind: ->
      Backbone.history.off 'route', @_historyListener
      @scrollbinder.unbind()

    _getCurrentPage: (pos)->
      result = _.reduce @pages, ((memo, page)->
        $el = $(page)
        top = $el.offset().top
        delta = Math.abs(pos-top)
        if !memo? or (memo.delta > delta)
          {$el, top, delta}
        else
          memo
      ), null
      result.$el

    scrollTo: ($el, callback) ->
      return unless $el?
      return unless $el.length
      self = this
      if @__justBinded
        @$scrollEl.scrollTop $el.offset().top
        @__justBinded = false
      else
        @$scrollEl.stop().animate {
          scrollTop: $el.offset().top - 100

        }, {
          duration: 600
          step: => @_skipAnimation = true
          complete: do (callback=callback, $el=$el)-> ->
            self.navigateTo $el
            callback?()
        }

    navigateTo: ($el)->
      route = $el.attr('data-route')

      if route? and location.hash.indexOf(route) == -1
        common.router.navigate route
      Backbone.trigger 'MainPage::checkSponsors'
      Backbone.trigger 'MainMenuWidget::checkMenu'

    _scrollTopScrollEl: ->
      scrollTop = 0
      for el in @$scrollEl
        scrollTop = $(el).scrollTop()
        break if !!scrollTop
      scrollTop

    on_scroll: (e) ->
      if @_skipAnimation?
        @_skipAnimation = null
        return
      clearTimeout @_$_timeout if @_$_timeout?
      @$scrollEl.stop()
      @_$_timeout = setTimeout (=> @on_scroll_timeout() ), 200

    on_scroll_timeout: ->
      curPos = @_scrollTopScrollEl()
      $el = @_getCurrentPage curPos
      @navigateTo $el
      # if @checkPassScroll($el, curPos)
      #   @navigateTo $el
      # else
      #   @scrollTo $el

    checkPassScroll: ($el, curPos) ->
      top = $el.offset().top
      wndHeight = $(window).height()
      offset = curPos - top
      viewPort = (offset + wndHeight) * 0.99
      elHeight = $el.outerHeight()
      offset > @pageEdgeOffset and viewPort <= elHeight
