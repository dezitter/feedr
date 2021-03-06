import BaseController from './base';
import FeedModel from 'app/models/feed';
import FeedsCollection from 'app/collections/feeds';

class FeedsController extends BaseController {

    index() {
        return this.fetch('/feeds')
                   .then(res => {
                       return { collection: new FeedsCollection(res.feeds) };
                   });
    }

    get(id) {
        return this.fetch(`/feed/${id}`)
                   .then(res => {
                       return { model: new FeedModel(res.feed) };
                   });
    }

}

export default FeedsController;
