const APIUtil = require('./api_util');

class FollowToggle {
  constructor ($el) {
    this.userId = $el.data("user-id");
    this.followState = $el.data("initial-follow-state");
    this.el = $el;
    this.render();

    this.el.on("click", e => {
      this.handleClick();
    });
  }

  render() {
    if (this.followState === "following" || this.followState === "unfollowing") {
      this.el.prop("disabled", true);
    } else {
      this.el.prop("disabled", false);
    }

    if (this.followState === "unfollowed") {
      this.el.text("Follow!");
    }
    else {
      this.el.text("Unfollow!");
    }

  }

  handleClick() {
    if (this.followState === "unfollowed") {
      APIUtil.followUser(this.userId).then(() => {
        this.followState = "followed";
        this.render();
      });
      this.followState = "following";
      this.render();
    }
    else {
      APIUtil.unfollowUser(this.userId).then(() => {
        this.followState = "unfollowed";
        this.render();
      });
      this.followState = "unfollowing";
      this.render();
    }
  }
}

module.exports = FollowToggle;