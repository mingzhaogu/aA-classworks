const APIUtil = require('./api_util.js');

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.render();
    this.$el.on("click", (e) => this.handleClick(e));
  }

  render() {
    let followText = "";
    if (this.followState === "unfollowed") {
      followText = "Follow!";
    } else {
      followText = "Unfollow!";
    }
    this.$el.html(followText);
  }

  handleClick(e) {
    e.preventDefault();

    if (this.followState === "followed") {
      APIUtil.unfollowUser(this.userId).then(() => this.toggleState());
    } else {
      APIUtil.followUser(this.userId).then(() => this.toggleState());
    }
  }

  toggleState() {
    if (this.followState === "unfollowed") {
      this.followState = "followed";
    } else {
      this.followState = "unfollowed";
    }
    this.render();
  }
}

module.exports = FollowToggle;
