{__test__: {orderKey}} = require 'cress-type/dest/ext-order'
Should = require 'should'
_ = require 'lodash'

describe 'function orderKey', ->
  Object.defineProperties (different = {}), 
    obj: get: -> 
      [
        {b: '', '3': 0, g: null, z: undefined, k: {}},
        {}
      ]
    keys: get: ->
      [
        ['z', 'uuu', '3', 'b'],
        ['g', 'b', 'z', '3'],
        ['aaa'],
        []
      ] 
    expected: get: ->
      [
        [
          keys: ['3', 'g', 'k','z', 'b']
        ,
          keys: ['3', 'k', 'g', 'b', 'z']
        ,
          keys: ['3', 'b', 'g', 'z', 'k']
        ,
          keys: ['3', 'b', 'g', 'z', 'k']
        ]
      ,
        [
          keys: []
        ,
          keys: []
        ,
          keys: []
        ,
          keys: []
        ]     
      ]

  different.obj.forEach (__, i) -> 
    different.keys.forEach (__, j) ->
      obj = different.obj[i]
      keys = different.keys[j]

      describe "obj = #{JSON.stringify obj}, keys = #{JSON.stringify keys}", ->
        clone = _.clone obj
        pointer = obj
        orderKey obj, keys
        expected = different.expected[i][j]

        it "whether keys is correct", ->
          Should(expected.keys).be.eql  Object.keys(obj)

        it 'whether value is correct', ->
          Should(pointer).be.equal obj
          Should(obj[key]).equal clone[key] for key in Object.keys(obj)


