
import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form';

 class TodoList extends React.Component {
  constructor (){
    super();
    this.state = {};

  }

  componentDidMount() {
    this.props.fetchTodos();
  }



  render (){
    const { todos, createTodo, updateTodo, errors } = this.props;

    return (
      <div>
        <ul>
          {todos.map( todo =>
            <TodoListItem todo={todo} updateTodo={updateTodo} key={todo.id}/>
          )}
        </ul>
        <TodoForm errors={errors} createTodo={createTodo}/>
      </div>
    );
  }
 }


 export default TodoList;
 // removeTodo={removeTodo}
