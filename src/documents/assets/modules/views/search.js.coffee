REACT = require('REACT')

#========

{form, div, input} = REACT.DOM
Search = REACT.createClass
  render: ->
    form {},
      div className:"large-4 columns",
        input type:"text", placeholder:"search"

module.exports = REACT.createFactory(Search)
