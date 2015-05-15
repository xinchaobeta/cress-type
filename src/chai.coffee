isCompatible = require './core'

module.exports = (chai, utils) ->
  chai.Assertion.addMethod 'compatible', (expects) ->
    {isCompatible, path} = isCompatible @_obj, expects
    msg = "expect #{JSON.stringify @_obj} to be type compatible with: #{JSON.stringify(expects)}"
    msg +=  "\n\tbut fail at the key: #{path}" if path
    chai.assert isCompatible is true, msg

