import HomeView from 'app/views/pages/home';
import EntriesView from 'app/views/pages/entries';
import ArchiveView from 'app/views/pages/archive';
import FeedView from 'app/views/pages/feed';
import FeedsView from 'app/views/pages/feeds';

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
