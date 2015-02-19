REACT = require('REACT')

#========

{div, h1} = REACT.DOM
HelloWorld = REACT.createClass
  render: ->
    div {},
      h1 {}, 'Hello, world 10!'

module.exports = REACT.createFactory(HelloWorld)
