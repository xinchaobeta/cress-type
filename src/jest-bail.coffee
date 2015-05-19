###
use under jest --runInBand
###
jest.dontMock './jest'

require './jest'

jasmine.getEnv().afterEach ->
  unless @results().passed()
    process.env.JEST_BAIL = true
    @env.specFilter = ->

process.exit() if process.env.JEST_BAIL