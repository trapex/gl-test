define (require, exports, module)->
  _Modal = require '../_Modal'
  require 'backboneValidation'
  require 'jqueryMaskedinput'
  MessageModal = require 'view/modal/MessageModal/MessageModal'

  FeedbackModel = Backbone.Epoxy.Model.extend
    defaults:
      name: ''
      phone: ''
      email: ''
      text: ''

    validation:
      name:
        required: true
        minLength: 2
      text:
        required: true
        minLength: 1
      phone:
        required: ->
          !@isValid('email')
      email:
        pattern: 'email'
        required: ->
          !@get('phone')

  FeedbackModal = _Modal.extend
    template: '#FeedbackModal'
    className: 'feedback_modal'

    ui:
      name: '[data-js-name]'
      phone: '[data-js-phone]'
      email: '[data-js-email]'
      text: '[data-js-text]'
      send_btn: '[data-js-send-btn]'

    events:
      'keyup @ui.name': 'onChangeForm'
      # 'keyup @ui.phone': 'onChangeForm'
      'change @ui.phone': 'onChangeForm'
      'keyup @ui.email': 'onChangeForm'
      'keyup @ui.text': 'onChangeForm'
      'click @ui.send_btn': 'onClickSendBtn'

    initialize: ->
      _Modal::initialize.apply this, arguments
      @model = new FeedbackModel
      Backbone.Validation.bind this

    render: ->
      @ui.phone.mask '+7 (999) 999 9999'

    showModal: ->
      #You code here
      _Modal::showModal.apply this, arguments

    checkValidation: ->
      if @model.isValid(true)
        @ui.send_btn.removeClass 'lock'
      else
        @ui.send_btn.addClass 'lock'

    onChangeForm: ->
      @model.set {
        name: @ui.name.val()
        phone: @ui.phone.val()
        email: @ui.email.val()
        text: @ui.text.val()
      }
      @checkValidation()

    onClickSendBtn: ->
      return if @ui.send_btn.hasClass 'lock'
      common.api.post_feedback @model.toJSON()
      .done (data) ->
        (new MessageModal).showModal(data.msg)
      .fail (data) ->
        (new MessageModal).showModal data.field.error

    remove: ->
      Backbone.Validation.unbind this
