cube = require('../simpleFunctions').cube
assert = require 'assert'

describe 'testing a coffeescript cube function', ->
  it '3 cubed is 27', ->
    assert.equal 27, cube(3)
  it '-3 cubed is -27', ->
    assert.equal -27, cube(-3)