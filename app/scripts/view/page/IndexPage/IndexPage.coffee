define (require, exports, module)->
  _ScrollPage = require '../_ScrollPage'
  NewsList = require 'view/list/NewsList/NewsList'
  FeedbackModal = require 'view/modal/FeedbackModal/FeedbackModal'
  MenuWidget = require 'view/widget/MenuWidget/MenuWidget'

  IndexPage = _ScrollPage.extend
    template: '#IndexPage'
    className: 'index_page'

    ui:
      news: '[data-js-news]'
      feedback_btn: '[data-js-feedback]'

    events:
      'click @ui.feedback_btn': 'onClickFeedback'

    regions:
      news:
        el: '[data-js-news]'
        view: NewsList
      menu:
        el: '[data-js-menu]'
        view: MenuWidget

    onClickFeedback: ->
      @modal = new FeedbackModal
      @modal.showModal()

    route: (section) ->
      @scrollTo "[data-route=#{section}]"

