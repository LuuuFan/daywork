import { applyMiddleware, createStore } from 'redux';
import logger from 'redux-logger';
import thunk from 'redux-thunk';
import rootReducer from '../reducers/root_reducer';

const configureStore = () => {
  return createStore(rootReducer, applyMiddleware(thunk, logger));
};

// const store = createStore(rootReducer);

// export default store;
export default configureStore;
