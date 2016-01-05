import AllEntriesView from 'app/views/pages/entries/all';
import ArchiveEntriesView from 'app/views/pages/entries/archive';
import FeedView from 'app/views/pages/feed';
import FeedsView from 'app/views/pages/feeds';
import HomeView from 'app/views/pages/home';
import StarredEntriesView from 'app/views/pages/entries/starred';

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
        view: AllEntriesView,
        controller: EntriesController,
        action: 'all'
    },

    'entries/starred': {
        view: StarredEntriesView,
        controller: EntriesController,
        action: 'starred'
    },

    'entries/archive': {
        view: ArchiveEntriesView,
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
