import BaseEntriesView from 'app/views/pages/entries/base';

class EntriesView extends BaseEntriesView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/entries/starred';
    }

}

export default EntriesView;
