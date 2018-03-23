const Router = require('./router.js');

document.addEventListener('DOMContentLoaded', () => {
  const ell = document.querySelector('.content');
  const router = new Router(ell);
  router.start();


  const sidebarLis = document.querySelectorAll('.sidebar-nav li');
  sidebarLis.forEach((el) => {
    el.addEventListener('click', (e) => {
      const inner = e.currentTarget.innerText.toLowerCase();
      window.location.hash = inner;
    });
  });
});
