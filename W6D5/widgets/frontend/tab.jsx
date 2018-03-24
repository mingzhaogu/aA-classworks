import React from 'react';

class Tab extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selection: 0,
    };
  }

  clickHandler(id) {
    return () => this.setState({ selection: id }) ;
  }

  render() {
    let { tabs } = this.props;
    return (
      <div className='tabs'>
        <ul>
          {tabs.map((tab, idx) => {
            return <h1
              key={tab.key}
              id={tab.id}
              onClick={this.clickHandler(tab.id)}>{tab.title}</h1>;
          })}
        </ul>
        <article>
          {tabs[this.state.selection].content}
        </article>
      </div>
    );
  }
}

export default Tab;


// <div>
//   <ul className='tab'>
//     {this.array.map((tab) => {
//       return (
//         <h1
//           onClick={this.clickHandler}
//           className='tab-title'
//           id={tab.title}>{tab.title}
//         </h1>
//       );
//     })}
//   </ul>
