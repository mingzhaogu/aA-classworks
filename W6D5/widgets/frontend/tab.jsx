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
            if (idx === this.state.selection) {
              return <h1
                key={tab.key}
                id={tab.id}
                className='tab clicked'
                onClick={this.clickHandler(tab.id)}>{tab.title}</h1>
            } else {
              return <h1
                key={tab.key}
                id={tab.id}
                className='tab'
                onClick={this.clickHandler(tab.id)}>{tab.title}</h1>;
            }
          })}
        </ul>
        <article>
          <div className='sub-article'>
            {tabs[this.state.selection].content}
          </div>
        </article>
      </div>
    );
  }
}

export default Tab;
