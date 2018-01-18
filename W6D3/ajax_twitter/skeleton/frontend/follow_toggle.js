class FollowToggle{
  constructor (el){
    this.$el = $(el);
    this.userId = this.$el.data("userid");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.handleClick();
  }


  render (){
    // debugger
    if (this.followState === false) {
      this.$el.text('follow');
    } else {
      this.$el.text('unfollow');
    }
  }

  // toggleFollowState(){
  //   if (this.followState === false) {
  //     this.followState = true;
  //   } else {
  //     this.fllowSate = false;
  //   }
  // }

   handleClick () {
    this.$el.on("click", (event) => {
      event.preventDefault();
      this.$el.prop("disable", true);
      this.$el.text('processing...');
      let method = this.followState ? 'DELETE' : 'POST';
      $.ajax({
        url: `/users/${this.userId}/follow`,
        type: method,
        dataType: 'json',
        // debugger
        success: ()=>{
          // debugger
          this.followState = !this.followState;
          this.render();
          this.$el.prop("disable", false);
        },
        error: ()=>{

        },
      });

    });
  }

}


module.exports = FollowToggle;
