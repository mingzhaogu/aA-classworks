const FollowToggle = require('./follow_toggle.js');

$(() => {
  const $followToggles = $('.follow-toggle');
  $followToggles.each((idx, button) => {
    const newToggle = new FollowToggle(button);
  });
});
