class Router {
  constructor(node) {
    this.node = node;
  }

  start() {
    this.render();
    window.onhashchange = this.render.bind(this);
  }

  activeRoute() {
    return window.location.hash.slice(1);
  }

  render() {
    this.node.innerHTML = "";
    const route = this.activeRoute();
    const el = document.createElement('p');
    el.innerText = route;
    this.node.appendChild(el);
  }
}

module.exports = Router;
