import CompositeView from 'app/views/composite';
import FormActionView from 'app/views/partials/entry/form/action';

class EntriesView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/entries/starred';
        this.children = {
            'form.feedr-form-action': FormActionView
        };
    }

    getTemplateData() {
        return { entries: this.collection.toJSON() };
    }
}

export default EntriesView;
