define (require, exports, module)->
  _Modal = require '../_Modal'
  TestModal = _Modal.extend
    template: '#TestModal'
    className: 'test_modal'

    #initialize: ->
    #  _Modal::initialize.apply this, arguments
    #  #You code here

    #showModal: ->
    #  #You code here
    #  _Modal::showModal.apply this, arguments
