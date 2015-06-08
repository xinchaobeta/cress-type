coffee = require 'coffee-script'
resolveRc = require 'babel-core/lib/babel/tools/resolve-rc'
babel = require 'babel-core'
{sep} = require 'path'

babelJest =
  opt: resolveRc(require.main?.filename or process.cwd())
  shouldIgnore: (filename) ->
    ignore = babel.util.arrayify @opt.ignore, babel.util.regexify
    only = babel.util.arrayify @opt.only, babel.util.regexify

    unless ignore or only
      filename.split(sep).indexOf("node_modules") >= 0
    else
      babel.util.shouldIgnore(filename, ignore or [], only or [])

  process: (src, filename) ->
    stage = process.env.BABEL_JEST_STAGE or @opt.stage or 2

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

