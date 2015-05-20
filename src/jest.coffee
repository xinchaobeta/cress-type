jest.dontMock('./core')

compatible = require './core'

jasmine.getEnv().beforeEach ->
  @addMatchers toBeCompatible: (expects) -> 
    (compatible expects, @actual).isCompatible