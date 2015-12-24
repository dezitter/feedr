import BaseController from './base';
import EntriesCollection from 'app/collections/entries';

class HomeController extends BaseController {

    index(cb) {
        cb(null, {
            collection: new EntriesCollection([
                { id:1, title: 'Foo', feed_title: 'Feed', url: 'http://www.example.com', starred: true  },
                { id:2, title: 'Bar', feed_title: 'Feed', url: 'http://www.example.com', starred: false },
                { id:3, title: 'Quz', feed_title: 'Feed', url: 'http://www.example.com', starred: false }
            ])
        });
    }

}

export default HomeController;
