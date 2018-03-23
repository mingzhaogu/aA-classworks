class DOMNodeCollection {
  constructor(elements) {
    this.elements = elements;
  }

  html(contents) {
    if (contents === undefined) {
      return this.elements[0].innerHTML;
    } else {
      this.elements.forEach((el) => {
        el.innerHTML = contents;
      });
    }

    return this;
  }

  empty() {
    this.html("");
  }

  append(child) {
    let contents;
    if (typeof child === "string") {
      contents = child;
    } else if (child instanceof HTMLElement) {
      contents = child.outerHTML;
    } else if (child instanceof DOMNodeCollection) {
      contents = child.html();
    }

    return this.html(contents);
  }

  attr(name, value) {
    if (value === undefined) {
      return this.elements[0].getAttribute(name);
    } else {
      this.elements.forEach((el) => el.setAttribute(name, value));
      return this;
    }
  }

  addClass(name) {
    const names = name.split(' ');
    this.elements.forEach((el) => {
      el.classList.add(...names);
    });
    return this;
  }

  removeClass(name) {
    const names = name.split(' ');
    this.elements.forEach((el) => {
      el.classList.remove(...names);
    });
    return this;
  }

  children() {
    const collection = [];
    this.elements.forEach((el) => {
      const childs = Array.from(el.children);
      collection = collection.concat(childs);
    });

    return new DOMNodeCollection(collection);
  }

  parent() {
    const collection = [];
    this.elements.forEach((el) => {
      if (el.parentNode) {
        collection.push(el.parentNode);
      }
    });

    return new DOMNodeCollection(collection);
  }

  find(selector) {
    const collection = new Set([]);
    this.elements.forEach((el) => {
      const selected = el.querySelectorAll(selector);
      selected.forEach((selection) => {
        collection.add(selection);
      });
    });
    return new DOMNodeCollection(Array.from(collection));
  }

  remove() {
    this.elements.forEach((el) => {
      el.remove();
    });
    return this;
  }

  on(trigger, action) {
    this.elements.forEach((el) => {
      el.addEventListener(trigger, action);
      el.events = el.events || {};
      el.events[trigger] = el.events[trigger] || [];
      el.events[trigger].push(action);
    });

    return this;
  }

  off(trigger, action) {
    this.elements.forEach((el) => {
      const actions = action ? [action] : el.events[trigger];
      actions.forEach((act) => {
        el.removeEventListener(trigger, act);
      });

      el.events[trigger] = el.events[trigger].filter((act) => {
        return !actions.includes(act);
      });
    });

    return this;
  }
}

module.exports = DOMNodeCollection;


















//
