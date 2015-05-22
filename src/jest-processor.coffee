coffee = require 'coffee-script'
{process} = require 'babel-jest'

module.exports = 
  process: (src, path) ->
    # CoffeeScript files can be .coffee, .litcoffee, or .coffee.md
    if coffee.helpers.isCoffee path
      coffee.compile src, 'bare': true
    else
      process src, path

