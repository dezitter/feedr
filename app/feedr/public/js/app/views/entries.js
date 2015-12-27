import BaseView from './base';
import MarkAsReadFormView from 'app/views/partials/entry/mark_as_read_form';

class EntriesView extends BaseView {

    constructor(options) {
        super(options);
        this.templateName = 'entries';
    }

    render() {
        super.render();

        this.attachChild(MarkAsReadFormView, 'form.feedr-mark-as-read');

        return this;
    }

    getTemplateData() {
        return { entries: this.collection.toJSON() };
    }
}

export default EntriesView;
