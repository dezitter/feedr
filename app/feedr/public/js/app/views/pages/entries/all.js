import CompositeView from 'app/views/composite';
import FormActionView from 'app/views/partials/entry/form/action';
import MarkAsReadFormView from 'app/views/partials/entry/form/mark_as_read';

class EntriesView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/entries/all';
        this.children = {
            'form.feedr-form-action': FormActionView,
            'form.feedr-mark-as-read': MarkAsReadFormView
        };
    }

    getTemplateData() {
        return { entries: this.collection.toJSON() };
    }
}

export default EntriesView;
