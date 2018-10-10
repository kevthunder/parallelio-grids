Element = require('spark-starter').Element
EventEmitter = require('spark-starter').EventEmitter
GridCell = require('./GridCell')
GridRow = require('./GridRow')


class Grid extends Element
  @extend EventEmitter
  @properties
    rows:
      collection: true
      itemAdded: (row)->
        row.grid = this
      itemRemoved: (row)->
        if row.grid == this
          row.grid = null
    maxColumns: 
      calcul: (invalidator)->
        rows = invalidator.prop('rows')
        rows.reduce (max, row) ->
            Math.max(max, invalidator.prop('cells',row).length)
          , 0
  addCell: (cell = null)->
    unless cell
      cell = new GridCell()
    spot = @getFreeSpot()
    row = @rows.get(spot.row)
    unless row
      row = @addRow()
    row.addCell(cell)
    cell
  addRow: (row = null)->
    unless row
      row = new GridRow()
    @rows.push(row)
    row
  getFreeSpot: ->
    spot = null
    @rows.some (row) =>
      if row.cells.length < @maxColumns
        spot = {row:row.rowPosition, column:row.cells.length}
    unless spot
      if @maxColumns > @rows.length
        spot = {row:@rows.length, column:0}
      else
        spot = {row:0, column:@maxColumns+1}
    spot
