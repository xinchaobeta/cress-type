jest.autoMockOff()

const Should = require('should')

const [base, target] = [1, 1]

describe(`test jest-processor`, () => {
  it(`whether babel is working`, () => {
    Should(base).be.equal(target)
  });
});