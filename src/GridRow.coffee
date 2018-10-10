Element = require('spark-starter').Element
EventEmitter = require('spark-starter').EventEmitter
GridCell = require('../lib/GridCell')

class GridRow extends Element
  @extend EventEmitter
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
        grid = invalidator.prop('grid')
        if grid
          invalidator.prop('rows',grid).indexOf(this)
    height:
      calcul: (invalidator)->
        1 / invalidator.prop('rows', invalidator.prop('grid')).length
    top:
      calcul: (invalidator)->
        invalidator.prop('height') * invalidator.prop('rowPosition')
    bottom:
      calcul: (invalidator)->
        invalidator.prop('height') * (invalidator.prop('rowPosition') + 1) 
  addCell: (cell = null)->
    unless cell
      cell = new GridCell()
    @cells.push(cell)
    cell
