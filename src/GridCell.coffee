Element = require('spark-starter').Element

module.exports = class GridCell extends Element
  @properties
    grid: 
      calcul: (invalidator)->
        invalidator.propPath('grid.row')
    row: {}
    columnPosition: 
      calcul: (invalidator)->
        row = invalidator.prop(@rowProperty)
        if row
          invalidator.prop(row.cellsProperty).indexOf(this)
    width:
      calcul: (invalidator)->
        1 / invalidator.propPath('row.cells').length
    left:
      calcul: (invalidator)->
        invalidator.prop(@widthProperty) * invalidator.prop(@columnPositionProperty)
    right:
      calcul: (invalidator)->
        invalidator.prop(@widthProperty) * (invalidator.prop(@columnPositionProperty) + 1) 
    height:
      calcul: (invalidator)->
        invalidator.propPath('row.height')
    top:
      calcul: (invalidator)->
        invalidator.propPath('row.top')
    bottom:
      calcul: (invalidator)->
        invalidator.propPath('row.bottom')
