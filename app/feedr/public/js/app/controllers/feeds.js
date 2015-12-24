import BaseController from './base';
import FeedsCollection from 'app/collections/feeds';

class FeedsController extends BaseController {

    index(cb) {
        cb(null, {
            collection: new FeedsCollection([
                { id:1, title: 'Feed' }
            ])
        });
    }

}

export default FeedsController;
