import React from 'react';

class Autocomplete extends React.Component {
  constructor() {
    super();
    this.state = {inputVal: '', result: ''};
    this.handleInput = this.handleInput.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  handleInput(e){
    // debugger
    const inputVal = e.currentTarget.value;
    const result = [];
    this.props.nameList.forEach(name=>{
      if (name.includes(inputVal)) {
        result.push(name);
      }
    });
    this.setState({inputVal, result});
  }

  handleClick(e){
    const inputVal = e.currentTarget.innerHTML;
    const input = document.querySelector('input');
    input.value = inputVal;
    const result = [inputVal];
    this.setState({inputVal, result});
  }


  render (){
    let list;
    if (this.state.inputVal) {
      list = this.state.result;
    } else {
      list = this.props.nameList;
    }
    // const list = this.state.inputVal ? this.state.result : this.props.namelist;
    // debugger
    return (
      <div className="">
        <h1>Autocomplete</h1>
        <div className="auto">
          <input onChange={this.handleInput} type="text" name="" placeholder="searching" />
          <ul>
            <span>
              {list.map((name, idx) => {
                return (
                  <li key={idx} onClick={this.handleClick}>
                    {name}
                  </li>
                );
              })}
            </span>
          </ul>
        </div>
      </div>
    );
  }
}


export default Autocomplete;
