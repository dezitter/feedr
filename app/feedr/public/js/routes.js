import EntriesController from 'app/controllers/entries';
import FeedsController from 'app/controllers/feeds';
import HomeController from 'app/controllers/home';

export default {

    '': {
        controller: HomeController,
        action: 'index'
    },

    'entries/all': {
        controller: EntriesController,
        action: 'all'
    },

    'entries/starred': {
        controller: EntriesController,
        action: 'starred'
    },

    'feeds': {
        controller: FeedsController,
        action: 'index'
    }

};
