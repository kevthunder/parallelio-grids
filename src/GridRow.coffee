Element = require('spark-starter').Element
GridCell = require('./GridCell')

module.exports = class GridRow extends Element
  @properties
    grid: {}
    cells:
      collection: true
      itemAdded: (cell)->
        cell.row = this
      itemRemoved: (cell)->
        if cell.row == this
          cell.row = null
    rowPosition: 
      calcul: (invalidator)->
        grid = invalidator.prop(@gridProperty)
        if grid
          invalidator.prop(grid.rowsProperty).indexOf(this)
    height:
      calcul: (invalidator)->
        1 / invalidator.propPath('grid.rows').length
    top:
      calcul: (invalidator)->
        invalidator.prop(@heightProperty) * invalidator.prop(@rowPositionProperty)
    bottom:
      calcul: (invalidator)->
        invalidator.prop(@heightProperty) * (invalidator.prop(@rowPositionProperty) + 1) 
  addCell: (cell = null)->
    unless cell
      cell = new GridCell()
    @cells.push(cell)
    cell
