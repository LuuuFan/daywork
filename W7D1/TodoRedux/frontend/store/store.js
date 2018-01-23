import { applyMiddleware, createStore } from 'redux';
import logger from 'redux-logger';
import rootReducer from '../reducers/root_reducer';

const configureStore = () => {
  return createStore(rootReducer, applyMiddleware(logger));
};

// const store = createStore(rootReducer);

// export default store;
export default configureStore;
