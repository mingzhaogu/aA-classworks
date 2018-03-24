import React from 'react';
import ReactDom from 'react-dom';
import Root from './frontend/root';

document.addEventListener('DOMContentLoaded', function () {
  console.log("script loaded;");
  ReactDom.render(<Root />, document.getElementById('root'));
});
