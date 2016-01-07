import BaseEntriesView from 'app/views/pages/entries/base';

class ArchiveView extends BaseEntriesView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/entries/archive';
    }

}

export default ArchiveView;
