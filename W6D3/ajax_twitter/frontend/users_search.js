const APIUtil = require('./api_util.js');

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.input = this.$el.input;
    this.ul = this.$el.ul;
  }

  handleInput(e) {
    APIUtil.searchUsers(this.input.value);
  }

  renderResults() {
    
  }
}

module.exports = UsersSearch;
