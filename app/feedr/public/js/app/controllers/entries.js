import BaseController from './base';

class EntriesController extends BaseController {

    all() {
        console.log('entries/all');
    }

    starred() {
        console.log('entries/starred');
    }

}

export default EntriesController;
