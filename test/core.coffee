Should = require 'should'
isCompatible = require 'cress-type'

describe 'function isCompatible', ->

  tests = [

  ####### number, *  ######
    args: [0, 0], expects: {isCompatible: true}
  ,
    args: [0, 1], expects: {isCompatible: true}
  ,
    args: [1, '1'], expects: {isCompatible: false, path: ''}
  ,
    args: [1, null], expects: {isCompatible: false, path: ''}
  ,
    args: [1, undefined], expects: {isCompatible: false, path: ''}
  ,
    args: [1, []], expects: {isCompatible: false, path: ''}
  ,
    args: [1, [1]], expects: {isCompatible: false, path: ''}
  ,
    args: [1, {}], expects: {isCompatible: false, path: ''}
  ,
    args: [1, {a:1}], expects: {isCompatible: false, path: ''}
  ,
    args: [1, ->], expects: {isCompatible: false, path: ''}
  ,
    args: [1, true], expects: {isCompatible: false, path: ''}
  ,
    args: [0, false], expects: {isCompatible: false, path: ''}

  ###### string, * #####
  ,
    args: ['', ''], expects: {isCompatible: true}
  ,
    args: ['1', '2'], expects: {isCompatible: true}
  ,
    args: ['1', 1], expects: {isCompatible: false, path: ''}
  ,
    args: ['', 0], expects: {isCompatible: false, path: ''}
  ,
    args: ['', null], expects: {isCompatible: false, path: ''}
  ,
    args: ['', undefined], expects: {isCompatible: false, path: ''}
  ,
    args: ['', []], expects: {isCompatible: false, path: ''}
  ,
    args: ['1', ['1']], expects: {isCompatible: false, path: ''}
  ,
    args: ['', {}], expects: {isCompatible: false, path: ''}
  ,
    args: ['1', {a:1}], expects: {isCompatible: false, path: ''}
  ,
    args: ['a', {a:1}], expects: {isCompatible: false, path: ''}
  ,
    args: ['', ->], expects: {isCompatible: false, path: ''}
  ,
    args: ['1', true], expects: {isCompatible: false, path: ''}
  ,
    args: ['0', false], expects: {isCompatible: false, path: ''}

  ##### * null, * #####
  ,
    args: [null, null], expects: {isCompatible: true}
  ,
    args: [null, undefined], expects: {isCompatible: false, path: ''}
  ,
    args: [null, ''], expects: {isCompatible: false, path: ''}
  ,
    args: [null, 0], expects: {isCompatible: false, path: ''}
  ,
    args: [null, ->], expects: {isCompatible: false, path: ''}

  ##### * undefined, * #####
  ,
    args: [undefined, undefined], expects: {isCompatible: true}
  ,
    args: [undefined, null], expects: {isCompatible: false, path: ''}
  ,
    args: [undefined, ''], expects: {isCompatible: false, path: ''}
  ,
    args: [undefined, 0], expects: {isCompatible: false, path: ''}
  ,
    args: [undefined, ->], expects: {isCompatible: false, path: ''} 


  ######  array, *  ######
  ,
    args: [[], []], expects: {isCompatible: true}
  ,
    args: [[[], {}], [[], {}]], expects: {isCompatible: true}
  ,
    args: [[1, 'a', null, false, undefined], [0, 'bcd', null, true, undefined]], expects: {isCompatible: true}
  ,
    args: [[1], [1, 2]], expects: {isCompatible: true}
  ,
    args: [[[]], [[[]]]], expects: {isCompatible: true}
  ,
    args: [[{}], [{a: 1}]], expects: {isCompatible: true}
  ,
    args: [[1, 2], [1]], expects: {isCompatible: false, path: '[1]'}
  ,
    args: [[[[]]], [[]]], expects: {isCompatible: false, path: '[0][0]'}
  ,
    args: [[1], ->], expects: {isCompatible: false, path: ''}

  ######  Object, * ######
  ,
    args: [{}, {}], expects: {isCompatible: true}
  ,
    args: [{a: 1}, {a: 3}], expects: {isCompatible: true}
  ,
    args: [{}, {a: 1}], expects: {isCompatible: true}
  ,
    args: [{}, null], expects: {isCompatible: false, path: ''}
  ,
    args: [{}, ''], expects: {isCompatible: false, path: ''}
  ,
    args: [{}, 0], expects: {isCompatible: false, path: ''}
  ,
    args: [{}, ->], expects: {isCompatible: false, path: ''} 
  ,
    args: [{a: []}, {}], expects: {isCompatible: false, path: '.a'}

  ######   Function, *   #####
  ,
    args: [(->), (->)], expects: {isCompatible: true}
  ,
    args: [(->), null], expects: {isCompatible: false, path: ''}
  ,
    args: [(->), ''], expects: {isCompatible: false, path: ''}
  ,
    args: [(->), 0], expects: {isCompatible: false, path: ''}
  ,
    args: [(->), undefined], expects: {isCompatible: false, path: ''}
  ,
    args: [(->), {}], expects: {isCompatible: false, path: ''}
  ]

  tests.forEach ({args: [base, target], expects})->
    it """
      base = #{JSON.stringify base}, \
      target = #{JSON.stringify(target)}, \
      expects = #{JSON.stringify(expects)}
    """, ->  
      expects.should.eql isCompatible(base, target)

  return








