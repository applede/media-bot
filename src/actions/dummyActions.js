import alt from 'control';
import {createActions} from 'alt/utils/decorators';

@createActions(alt)
class DummyActions {
  constructor() {
    this.generateActions('updateName');
  }
}

export default DummyActions;
