import BaseController from './base';
import EntriesCollection from 'app/collections/entries';

class EntriesController extends BaseController {

    all(cb) {
        this.fetch('/api/entries/all', (err, res) => {
            if (err) { return cb(err); }

            cb(null, { collection: new EntriesCollection(res.entries) });
        });
    }

    starred(cb) {
        this.fetch('/api/entries/starred', { starred: true }, (err, res) => {
            if (err) { return cb(err); }

            cb(null, { collection: new EntriesCollection(res.entries) });
        });
    }

}

export default EntriesController;
