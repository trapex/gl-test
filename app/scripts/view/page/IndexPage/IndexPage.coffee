define (require, exports, module)->
  _Page = require '../_Page'
  # AuthModal = require 'view/modal/AuthModal/AuthModal'
  NewsList = require 'view/list/NewsList/NewsList'

  IndexPage = _Page.extend
    template: '#IndexPage'
    className: 'index_page'

    ui:
      news: '[data-js-news]'

    events:
      'click @ui.auth': 'onClick'

    regions:
      news:
        el: '[data-js-news]'
        view: NewsList

