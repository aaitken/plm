---
browserify: true
---

REACT = require('REACT')

#========

{form, div, input} = REACT.DOM
module.exports = REACT.createFactory REACT.createClass
  render: ->
    form {},
      div className:"large-4 columns",
        input type:"text", placeholder:"search"

