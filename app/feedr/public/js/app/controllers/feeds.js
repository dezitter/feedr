import BaseController from './base';
import FeedModel from 'app/models/feed';
import FeedsCollection from 'app/collections/feeds';

class FeedsController extends BaseController {

    index(cb) {
        this.fetch('/api/feeds', (err, res) => {
            if (err) { return cb(err); }

            cb(null, { collection: new FeedsCollection(res.feeds) });
        });
    }

    get(id, cb) {
        this.fetch(`/api/feed/${id}`, (err, res) => {
            if (err) { return cb(err); }

            cb(null, { model: new FeedModel(res.feed) });
        });
    }

}

export default FeedsController;
