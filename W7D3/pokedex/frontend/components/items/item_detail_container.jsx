import React from 'react';
import {connect} from 'react-redux';
import ItemDetail from './item_detail';
import {withRouter} from 'react-router-dom';


const mapStateToProps = (state, ownProps) => {
  // debugger
  return {
    item: state.entities.items[ownProps.match.params.itemId]
  }
};


// const mapDispatchToProps = dispatch => ({
// });


export default withRouter(connect(
  mapStateToProps,
  null
)(ItemDetail)
);
