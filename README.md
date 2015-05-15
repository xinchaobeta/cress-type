# Cress Type

This is an addon plugin both for the [chai](http://github.com/logicalparadox/chai) assertion library and the [should.js](https://github.com/tj/should.js) assertion library. It provides the
most basic function type compare ability and tests. 

## Installation

#### Node.js

Cress Type are available on npm.

      $ npm install cress-type


## Usage

### Use As a Chai Plug In

```js
var chai = require('chai')
  , compatible = require('cress-type/dest/chai');

chai.use(compatible);

var should = chai.should()
  , expect = chai.expect;

data1 = ['example', 1, {user: {name: 'cress', age: 99} }]
data2 = ['another example', 2, {user: {name: 'haha', age: 0}}]

//expect mode
expect(data1).to.be.compatible(data2)

//should mode
data1.should.be.compatible(data2)
```

### Use As a Should.js Plug In

```js
var Should = require('should')
  , compatible = require('cress-type/dest/should');

Should.use(compatible);

data1 = ['example', 1, {user: {name: 'cress', age: 99} }]
data2 = ['another example', 2, {user: {name: 'haha', age: 0}}]

data1.should.be.compatible(data2)
```


### Use Not As Plug In

```js
var compatible = require('cress-type');

data1 = ['example', 1, {user: {name: 'cress', age: 99} }]
data2 = ['another example', 2, {user: {name: 777, age: 0}}]

compatible(data1, data2)  

//will output: {isCompatible: false, path: '[2].user.name'}
//  which means
//           typeof data1[2].user.name !== typeof data2[2].user.name
```


## License

(The MIT License)
