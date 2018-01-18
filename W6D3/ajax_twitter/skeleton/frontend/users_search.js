const FollowToggle = require('./follow_toggle.js');

class UsersSearch {

  constructor (el) {
    this.$el = $(el);
    // debugger
    this.input = this.$el.find('input');
    this.ul = this.$el.find('ul');
    this.handleInput();
  }

  searchUsers (queryVal) {
    this.ul.empty();
    $.ajax({
      url: '/users/search',
      type: 'GET',
      dataType: 'json',
      data: { query: queryVal},
      success: (data) => {
        // debugger
        data.forEach(el => {
          // const $li = $('<li></li>')
          console.log(el);
          // debugger
          // const li = document.createElement('li');
          // $(li).text(`${el.username}`);
          const $li = $("<li>");
          const $a = $('<a>', {text: `${el.username}`, href: `/users/${el.id}`});
          // const $button = $("<button>", {"class": 'follow-toggle'});
          const button = document.createElement('button');
          $(button).addClass('follow-toggle');
          $(button).data('userid', `${el.id}`);
          $(button).data('initial-follow-state', el.followed);
          let btn = new FollowToggle(button);
          btn.render();
          $li.append($a);
          $li.append(button);
          this.ul.append($li);
        });
        // debugger
      },
      error: () => {

      }
    });
  }

  handleInput () {
    this.$el.on('input', (event) => {
      let input = this.input.val();
      // debugger
      this.searchUsers(input);
    });
  }

  renderResults () {

  }


}


module.exports = UsersSearch;
