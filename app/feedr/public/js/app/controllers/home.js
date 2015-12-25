import BaseController from './base';
import EntriesCollection from 'app/collections/entries';

class HomeController extends BaseController {

    index(cb) {
        this.fetch('/api/entries/all', { query: { limit: 10 } }, (err, res) => {
            if (err) { return cb(err); }

            cb(null, { collection: new EntriesCollection(res.entries) });
        });
    }

}

export default HomeController;
