jest.autoMockOff()

import {actual, expected} from 'test/for-jest-processor'

const Should = require('should')

const [base, target] = [1, 1]

describe(`test jest-processor`, () => {
  it(`whether babel is working`, () => {
    Should(base).be.equal(target)
  });

  it('whether babelrc is working on jest', () => {
    Should(actual).be.equal(expected)
  });
});


