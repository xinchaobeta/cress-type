jest.dontMock('./core')

compatible = require './core'

jasmine.getEnv().beforeEach ->
  @addMatchers toBeCompatible: (expects) -> 
    (compatible @actual, expects).isCompatible