define (require, exports, module)->
  _Layout = require '../_Layout'
  
  MenuLayout = _Layout.extend
    template: '#MenuLayout'
    
    className: 'menu_layout'


