import React from 'react';

class StepForm extends React.Component {
  constructor (){
    super();
    this.state = {};
  }


  render(){
    return(
      <form className="new-todo-form">
        {this.props.errors ?  <ul>{this.props.errors}</ul> : ""}
        <label>Title:</label>
        <br />
        <input id='form-title' type="text" />
        <br />

        <label>Description:</label>
        <br />
        <input id='form-body' type="text" />
        <br />
        <button onClick={this.handleSubmit} className='create-button'>Create Step!</button>
      </form>
    );
  }
}

export default StepForm;
