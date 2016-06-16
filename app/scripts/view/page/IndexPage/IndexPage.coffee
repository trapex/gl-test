define (require, exports, module)->
  _Page = require '../_Page'
  # AuthModal = require 'view/modal/AuthModal/AuthModal'
  NewsList = require 'view/list/NewsList/NewsList'
  FeedbackModal = require 'view/modal/FeedbackModal/FeedbackModal'

  IndexPage = _Page.extend
    template: '#IndexPage'
    className: 'index_page'

    ui:
      news: '[data-js-news]'
      feedback_btn: '[data-js-feedback]'

    events:
      'click @ui.auth': 'onClick'
      'click @ui.feedback_btn': 'onClickFeedback'

    regions:
      news:
        el: '[data-js-news]'
        view: NewsList

    onClickFeedback: ->
      @modal = new FeedbackModal
      @modal.showModal()

