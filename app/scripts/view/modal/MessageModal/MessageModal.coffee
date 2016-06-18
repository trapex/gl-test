define (require, exports, module)->
  _Modal = require '../_Modal'

  MessageModal = _Modal.extend
    template: '#MessageModal'
    className: 'message_modal'

    ui:
      text: '[data-js-text]'

    initialize: ->
      _Modal::initialize.apply this, arguments
      #You code here

    showModal: (data) ->
      $('html').scrollTop(0)
      @ui.text.text data
      _Modal::showModal.apply this, arguments
