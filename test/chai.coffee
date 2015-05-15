chai = require 'chai'
compatible = require 'cress-type/dest/chai'

chai.use compatible

describe 'compatible middleware for chai', ->
  base = a: 55
  target = a: 66, b: 'gaga'

  it """
    use plugin to test base = #{JSON.stringify base}, target = #{JSON.stringify target}
  """, ->
    chai.expect(base).be.compatible target