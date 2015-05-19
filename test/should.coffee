Should = require 'should'
compatible = require 'cress-type/dest/should'

Should.use compatible

describe 'compatible middleware for should', ->
  base = a: 2
  target = a: 6, b: 'haha'

  it """
    use should.js plugin to test base = #{JSON.stringify base}, target = #{JSON.stringify target}
  """, ->
    base.should.be.compatible target
    target.should.be.not.compatible base