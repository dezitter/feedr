import BaseEntriesView from 'app/views/pages/entries/base';
import RefreshFormView from 'app/views/partials/feed/form/refresh';
import MarkAsReadFormView from 'app/views/partials/entry/form/mark_as_read';

class EntriesView extends BaseEntriesView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/entries/all';

        this.children['form.feedr-refresh'] = RefreshFormView;
        this.children['form.feedr-mark-as-read'] = MarkAsReadFormView;
    }

}

export default EntriesView;
