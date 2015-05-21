# note: numerical key always prior to the string key
#       which means you can't order a string key to be prior to a numerical key
orderKey = (obj, orders) ->
  for key in orders
    if key of obj
      value = obj[key]
      delete obj[key]
      obj[key] = value
  return

module.exports = (exts) ->
  orderKey(require.extensions, exts)


###
  only for tests
###
module.exports.__test__ = {orderKey}
