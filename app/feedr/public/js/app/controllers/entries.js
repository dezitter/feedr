import BaseController from './base';
import EntriesCollection from 'app/collections/entries';

class EntriesController extends BaseController {

    all() {
        return this.fetch('/entries/all')
                   .then(res => {
                       return { collection: new EntriesCollection(res.entries) };
                   });
    }

    starred() {
        let options = { starred: true };

        return this.fetch('/entries/starred', options)
                   .then(res => {
                       return { collection: new EntriesCollection(res.entries) };
                   });
    }

}

export default EntriesController;
