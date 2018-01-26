import React from 'react';
import {connect} from 'react-redux';
import ItemDetail from './item_detail';
import {withRouter} from 'react-roter-dom';


const mapStateToProps = (state, ownProps) => ({

});


const mapDispatchToProps = dispatch => ({

});


export default withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(ItemDetail)
);
