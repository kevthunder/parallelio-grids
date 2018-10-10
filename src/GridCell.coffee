Element = require('spark-starter').Element
EventEmitter = require('spark-starter').EventEmitter

class GridCell extends Element
  @extend EventEmitter
  @properties
    grid: 
      calcul: (invalidator)->
        invalidator.prop('grid',invalidator.prop('row'))
    row: {}
    columnPosition: 
      calcul: (invalidator)->
        row = invalidator.prop('row')
        if row
          invalidator.prop('cells',row).indexOf(this)
    width:
      calcul: (invalidator)->
        1 / invalidator.prop('cells', invalidator.prop('row')).length
    left:
      calcul: (invalidator)->
        invalidator.prop('width') * invalidator.prop('columnPosition')
    right:
      calcul: (invalidator)->
        invalidator.prop('width') * (invalidator.prop('columnPosition') + 1) 
    height:
      calcul: (invalidator)->
        invalidator.prop('height', invalidator.prop('row'))
    top:
      calcul: (invalidator)->
        invalidator.prop('top', invalidator.prop('row'))
    bottom:
      calcul: (invalidator)->
        invalidator.prop('bottom', invalidator.prop('row'))
