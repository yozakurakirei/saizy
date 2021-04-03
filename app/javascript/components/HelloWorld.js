import React from "react"
import PropTypes from "prop-types"
class HelloWorld extends React.Component {
  render () {
    // ここはJavaScript
    return ( 
      // ここはJSX
      <React.Fragment>
        Greeting: {this.props.greeting}
        <h1>こんにちはReactさん</h1> 
      </React.Fragment>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};
export default HelloWorld
