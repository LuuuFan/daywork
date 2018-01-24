import React from 'react';
import TodoDetailViewContainer from '../todo_list/todo_detail_view_container';

class TodoListItem extends React.Component{
  constructor (props){
    super(props);
    this.state = {show: false};
    // this.flip = this.flip.bind(this);
  }


  flip (){
    this.setState({show: !this.state.show});
  }

  render(){
    return (
      <li className='todo-list-item'>
        <div className='todoHeader'>
        <h3>
          <a onClick={ () => {this.flip()} }>
            {this.props.todo.title}
          </a>
        </h3>
        <button onClick={()=> this.props.updateTodo(this.props.todo)} className={this.props.todo.done ? 'Undo' : 'Done'}>{ this.props.todo.done ? 'Undo' : 'Done' }</button>
        </div>
        {this.state.show ? <TodoDetailViewContainer todo={this.props.todo} /> : ''}
      </li>
    );
  }

}

export default TodoListItem;



// <button onClick={ ()=>props.removeTodo(props.todo) } className="DeleteTodo">Delete Todo</button>
//
