import HomeView from 'app/views/home';
import EntriesView from 'app/views/entries';
import FeedsView from 'app/views/feeds';

import EntriesController from 'app/controllers/entries';
import FeedsController from 'app/controllers/feeds';
import HomeController from 'app/controllers/home';

export default {

    '': {
        view: HomeView,
        controller: HomeController,
        action: 'index'
    },

    'entries/all': {
        view: EntriesView,
        controller: EntriesController,
        action: 'all'
    },

    'entries/starred': {
        view: EntriesView,
        controller: EntriesController,
        action: 'starred'
    },

    'feeds': {
        view: FeedsView,
        controller: FeedsController,
        action: 'index'
    }

};
