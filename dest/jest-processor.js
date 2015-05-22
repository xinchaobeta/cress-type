// Generated by CoffeeScript 1.9.2
var coffee, process;

coffee = require('coffee-script');

process = require('babel-jest').process;

module.exports = {
  process: function(src, path) {
    if (coffee.helpers.isCoffee(path)) {
      return coffee.compile(src, {
        'bare': true
      });
    } else {
      return process(src, path);
    }
  }
};
