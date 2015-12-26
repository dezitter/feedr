import BaseController from './base';
import EntriesCollection from 'app/collections/entries';

class EntriesController extends BaseController {

    all() {
        return this.fetch('/api/entries/all')
                   .then(res => {
                       return { collection: new EntriesCollection(res.entries) };
                   });
    }

    starred() {
        let options = { starred: true };

        return this.fetch('/api/entries/starred', options)
                   .then(res => {
                       return { collection: new EntriesCollection(res.entries) };
                   });
    }

}

export default EntriesController;
