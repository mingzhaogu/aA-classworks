import React from 'react';
import ReactDom from 'react-dom';
import Root from './frontend/root';

document.addEventListener('DOMContentLoaded', function () {
  ReactDom.render(<Root />, document.getElementById('root'));
});
