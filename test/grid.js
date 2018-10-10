(function() {
  var Grid, assert;

  assert = require('chai').assert;

  Grid = require('../lib/Grid');

  describe('Grid', function() {
    it('can have 1 cell', function() {
      var cell1, grid;
      grid = new Grid();
      cell1 = grid.addCell();
      assert.equal(cell1.top, 0);
      assert.equal(cell1.left, 0);
      assert.equal(cell1.bottom, 1);
      assert.equal(cell1.right, 1);
      assert.equal(cell1.width, 1);
      return assert.equal(cell1.height, 1);
    });
    it('can have 2 cells', function() {
      var cell1, cell2, grid;
      grid = new Grid();
      cell1 = grid.addCell();
      cell2 = grid.addCell();
      assert.equal(cell1.top, 0);
      assert.equal(cell1.left, 0);
      assert.equal(cell1.bottom, 1);
      assert.equal(cell1.right, 0.5);
      assert.equal(cell1.width, 0.5);
      assert.equal(cell1.height, 1);
      assert.equal(cell2.top, 0);
      assert.equal(cell2.left, 0.5);
      assert.equal(cell2.bottom, 1);
      assert.equal(cell2.right, 1);
      assert.equal(cell2.width, 0.5);
      return assert.equal(cell2.height, 1);
    });
    it('can have 3 cells', function() {
      var cell1, cell2, cell3, grid;
      grid = new Grid();
      cell1 = grid.addCell();
      cell2 = grid.addCell();
      cell3 = grid.addCell();
      assert.equal(cell1.top, 0);
      assert.equal(cell1.left, 0);
      assert.equal(cell1.bottom, 0.5);
      assert.equal(cell1.right, 0.5);
      assert.equal(cell1.width, 0.5);
      assert.equal(cell1.height, 0.5);
      assert.equal(cell2.top, 0);
      assert.equal(cell2.left, 0.5);
      assert.equal(cell2.bottom, 0.5);
      assert.equal(cell2.right, 1);
      assert.equal(cell2.width, 0.5);
      assert.equal(cell2.height, 0.5);
      assert.equal(cell3.top, 0.5);
      assert.equal(cell3.left, 0);
      assert.equal(cell3.bottom, 1);
      assert.equal(cell3.right, 1);
      assert.equal(cell3.width, 1);
      return assert.equal(cell3.height, 0.5);
    });
    return it('can have 4 cells', function() {
      var cell1, cell2, cell3, cell4, grid;
      grid = new Grid();
      cell1 = grid.addCell();
      cell2 = grid.addCell();
      cell3 = grid.addCell();
      cell4 = grid.addCell();
      assert.equal(cell1.top, 0);
      assert.equal(cell1.left, 0);
      assert.equal(cell1.bottom, 0.5);
      assert.equal(cell1.right, 0.5);
      assert.equal(cell1.width, 0.5);
      assert.equal(cell1.height, 0.5);
      assert.equal(cell2.top, 0);
      assert.equal(cell2.left, 0.5);
      assert.equal(cell2.bottom, 0.5);
      assert.equal(cell2.right, 1);
      assert.equal(cell2.width, 0.5);
      assert.equal(cell2.height, 0.5);
      assert.equal(cell3.top, 0.5);
      assert.equal(cell3.left, 0);
      assert.equal(cell3.bottom, 1);
      assert.equal(cell3.right, 0.5);
      assert.equal(cell3.width, 0.5);
      assert.equal(cell3.height, 0.5);
      assert.equal(cell4.top, 0.5);
      assert.equal(cell4.left, 0.5);
      assert.equal(cell4.bottom, 1);
      assert.equal(cell4.right, 1);
      assert.equal(cell4.width, 0.5);
      return assert.equal(cell4.height, 0.5);
    });
  });

}).call(this);
