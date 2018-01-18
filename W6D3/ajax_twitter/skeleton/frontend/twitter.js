const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');

$(() => {
  // debugger
  // alert('bundle is working,jQuery');
  const followToggle = new FollowToggle($('.follow-toggle'));
  const searchUsers = new UsersSearch($('.users-search'));
});
