import BaseController from './base';
import FeedsCollection from 'app/collections/feeds';

class FeedsController extends BaseController {

    index(cb) {
        this.fetch('/api/feeds', (err, res) => {
            if (err) { return cb(err); }

            cb(null, { collection: new FeedsCollection(res.feeds) });
        });
    }

}

export default FeedsController;
