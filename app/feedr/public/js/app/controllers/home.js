import BaseController from './base';
import EntriesCollection from 'app/collections/entries';

class HomeController extends BaseController {

    index() {
        let options = { query: { limit: 10 } };

        return this.fetch('/api/entries/all', options)
                   .then(res => {
                       return { collection: new EntriesCollection(res.entries) };
                   });
    }

}

export default HomeController;
