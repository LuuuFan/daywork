import React from 'react';

class Tabs extends React.Component {
  constructor() {
    super();
    this.state = {index: 0};
    this.clickHandler = this.clickHandler.bind(this);
  }

  clickHandler(e){
    e.preventDefault();
    // debugger
    let idx;
    switch (e.currentTarget.innerHTML) {
      case 'one':
        idx = 0;
        break;
      case 'two':
        idx = 1;
        break;
      case 'three':
        idx = 2;
        break;
    }
    // this.state.index;
    e.currentTarget.classList.add('active');
    this.setState({index: idx});
  }

  render(){
    // debugger
    return (
      <div className="tabs">
        <h1>Tabs</h1>
        <div className="tab-header">
          {this.props.title.map((title, idx) => {
              return(
                <span key={idx} id={idx} className={this.state.index===idx ? 'active' : ''}>
                  <span onClick={this.clickHandler}>{title}</span>
                </span>
              );
            })}
        </div>

        <div className="tab-content">
          <p>{ this.props.content[this.state.index] }</p>
        </div>
      </div>
    );
  }

}

export default Tabs;
