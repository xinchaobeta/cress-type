compatible = require './core'

module.exports = (Should, assertion)->
  assertion.add 'compatible', (expects)->
    {isCompatible, path} = compatible expects, @obj
    msg = "to be type compatible with: #{JSON.stringify(expects)}"
    msg +=  "\n\tbut fail at the key: #{path}" if path
    @params = operator: msg

    Should(true).equal isCompatible
