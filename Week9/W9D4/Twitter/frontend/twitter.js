const FollowToggle = require('./follow_toggle');

$(() => {
  $(".follow-toggle").each( function(_i, el) {
    new FollowToggle($(el));
  });
});