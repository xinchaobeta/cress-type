

###*
 * detect the type of target is compatible with the type of base
 * @param  {any} base      
 * @param  {any} target      
 * @outparam  {(string) => false} onFalse
 * @innerparam {string} path: in order to keep running fast, here we use tmp variable
 * @return {bool}             
###
compatibleType = (base, target, onFalse, path) ->

  if Array.isArray base
    unless Array.isArray target # empty array do not loop, so must have type check
      onFalse path
      return false
    for value, i in base by -1  
      return false unless compatibleType value, target[i], onFalse, "#{path}[#{i}]"        
    return true
  else if base is null
    if target is null
      return true
    else
      onFalse path
      return false
  else if 'object' is typeof base 
    unless 'object' is typeof target and null isnt target   # empty object do not loop, so must have type check
      onFalse path
      return false
    for key, i in Object.keys(base) by -1
      return false unless compatibleType base[key], target[key], onFalse, "#{path}.#{key}"
    return true

  else if typeof base is typeof target
    return true
  else
    onFalse path
    return false


###*
 * detect the type of target is compatible with the type of base
 * @param  {any}  base
 * @param  {any}  target 
 * @return {isCompatible: bool, path?: string} 
###
module.exports = (base, target) ->
  ret = {}
  onFalse = (path) -> ret.path = path
  ret.isCompatible = compatibleType base, target, onFalse, ''
  return ret


