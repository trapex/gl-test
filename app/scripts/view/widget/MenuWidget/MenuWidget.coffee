define (require, exports, module)->
  _Widget = require '../_Widget'
  
  MenuWidget = _Widget.extend
    template: '#MenuWidget'
    
    className: 'menu_widget'
