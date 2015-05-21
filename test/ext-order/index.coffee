Should = require 'should'

describe 'ext-order register', ->
  require.extensions['.es'] = require.extensions['.js']
  require('cress-type/dest/ext-order')(['.es', '.js'])
  example = require './example'

  it 'whether .es is prior to .js', ->
    Should(example).be.equal 'example.es'