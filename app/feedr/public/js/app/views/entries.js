import BaseView from './base';

class EntriesView extends BaseView {

    constructor(options) {
        super(options);
        this.templateName = 'entries';
    }

    getTemplateData() {
        return { entries: this.collection.toJSON() };
    }
}

export default EntriesView;
