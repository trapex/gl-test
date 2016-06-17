define (require, exports, module)->
  _Layout = require '../_Layout'
  
  MenuLayout = _Layout.extend
    template: '#MenuLayout'
    
    className: 'menu_layout'

    ui:
      href: '[data-js-href]'

    events:
      'click @ui.href': 'onClickMenu'

    onClickMenu: ->

