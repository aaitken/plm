React = require('React')
$ = require('jQuery')

#========

Test = React.createClass
  render: ->
    `(
    <div>
      <h1>Hello, world 10!</h1>
    </div>
    )`

React.render `
  <Test />,
  $('#example')[0]
  `
