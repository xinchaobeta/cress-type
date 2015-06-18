coffee = require 'coffee-script'
Json = require 'json5'
fs = require 'fs'
babel = require 'babel-core'
path = require 'path'

babelJest = new class
  constructor: ->
    @babelrc = do @resolveRc

  resolveRc: ->
    root = __dirname.split(/\bnode_modules\b/)[0...-1].join 'node_modules'
    try
      content = fs.readFileSync (path.join root, '.babelrc'), 'utf-8'
      return Json.parse content
    catch
      return {}

  shouldIgnore: (filename) ->
    ignore = babel.util.arrayify @babelrc.ignore, babel.util.regexify if @babelrc.ignore
    only = babel.util.arrayify @babelrc.only, babel.util.regexify if @babelrc.only

    unless ignore or only
      filename.split(path.sep).indexOf("node_modules") >= 0
    else
      babel.util.shouldIgnore(filename, ignore or [], only)

  process: (src, filename) ->
    stage = process.env.BABEL_JEST_STAGE or @babelrc.stage or 2

    if not @shouldIgnore(filename) and babel.canCompile(filename)
      babel.transform(src, {filename, stage, retainLines: true}).code
    else
      src

module.exports = 
  process: (src, path) ->
    # CoffeeScript files can be .coffee, .litcoffee, or .coffee.md
    if coffee.helpers.isCoffee path
      coffee.compile src, 'bare': true
    else
      babelJest.process src, path

