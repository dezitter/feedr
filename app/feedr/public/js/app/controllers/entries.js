import BaseController from './base';
import EntriesCollection from 'app/collections/entries';

function onEntriesResponse(response) {
    return { collection: new EntriesCollection(response.entries) };
}

class EntriesController extends BaseController {

    all() {
        return this.fetch('/entries/all')
                   .then(onEntriesResponse);
    }

    starred() {
        let options = { starred: true };

        return this.fetch('/entries/starred', options)
                   .then(onEntriesResponse);
    }

    archive() {
        return this.fetch('/entries/archive')
                   .then(onEntriesResponse);
    }

}

export default EntriesController;
