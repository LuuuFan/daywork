import React from 'react';
import TodoListContainer from '../todos/todo_list_container';

class TodoForm extends React.Component {
  constructor(props){
    super(props);
    this.state = {};
    this.handleSubmit = this.handleSubmit.bind(this);
    this.uniqueId = this.uniqueId.bind(this);
  }

  uniqueId(){
    return new Date().getTime();
  }

  handleSubmit(e) {
    e.preventDefault();
    let newTodo = {};
    newTodo['title'] = document.getElementById('form-title').value;
    newTodo['body'] = document.getElementById('form-body').value;
    newTodo['id'] = this.uniqueId();
    document.getElementById('form-body').value = '';
    document.getElementById('form-title').value = '';
    this.props.receiveTodo(newTodo);
  }

  render(){
    return (
      <form className="new-todo-form">
        <label>Title:</label>
        <br />
        <input id='form-title' type="text" />
        <br />

        <label>Body:</label>
        <br />
        <textarea id='form-body' rows="8" cols="40"></textarea>

        <br />
        <button onClick={this.handleSubmit}>Create Todo!</button>
      </form>
    );
  }
}

export default TodoForm;
