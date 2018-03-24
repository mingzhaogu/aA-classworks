import React from 'react';
import Clock from './clock';
import Weather from './weather';
import Tab from './tab';

const tabs = [
  {id: 0, key: 1, title: 'tab1', content: 'abcdefg'},
  {id: 1, key: 2, title: 'tab2', content: '01234567890'},
  {id: 2, key: 3, title: 'tab3', content: 'asdfjkl;'}
];

class Root extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <Clock />
        <br />
        <Weather />
        <br />
        <Tab tabs={tabs}/>
      </div>
    );
  }
}


export default Root;
