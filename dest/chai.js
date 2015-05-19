// Generated by CoffeeScript 1.9.2
var compatible;

compatible = require('./core');

module.exports = function(chai, utils) {
  return chai.Assertion.addMethod('compatible', function(expects) {
    var detail, isCompatible, msg1, msg2, path, ref, s1, s2;
    ref = compatible(this._obj, expects), isCompatible = ref.isCompatible, path = ref.path;
    s1 = JSON.stringify(this._obj);
    s2 = JSON.stringify(expects);
    if (path) {
      detail = "but fail at the key: " + path;
    }
    msg1 = "expect " + s1 + " to be type compatible with: " + s2 + " \n\t" + detail;
    msg2 = "expect " + s1 + " to be type incompatible with: " + s2;
    return this.assert(isCompatible === true, msg1, msg2);
  });
};
