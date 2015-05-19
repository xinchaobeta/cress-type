compatible = require './core'

module.exports = (chai, utils) ->
  chai.Assertion.addMethod 'compatible', (expects) ->
    {isCompatible, path} = compatible @_obj, expects
    s1 = JSON.stringify @_obj
    s2 = JSON.stringify(expects) 
    detail =  "but fail at the key: #{path}" if path

    msg1 = "expect #{s1} to be type compatible with: #{s2} \n\t#{detail}"
    msg2 = "expect #{s1} to be type incompatible with: #{s2}"

    @assert isCompatible is true, msg1, msg2

