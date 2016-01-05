import HomeView from 'app/views/home';
import EntriesView from 'app/views/entries';
import ArchiveView from 'app/views/archive';
import FeedView from 'app/views/feed';
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

    'entries/archive': {
        view: ArchiveView,
        controller: EntriesController,
        action: 'archive'
    },

    'feeds': {
        view: FeedsView,
        controller: FeedsController,
        action: 'index'
    },

    'feed/:id': {
        view: FeedView,
        controller: FeedsController,
        action: 'get'
    }

};
