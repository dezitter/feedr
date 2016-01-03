import CompositeView from './composite';
import FormActionView from 'app/views/partials/entry/form_action';
import MarkAsReadFormView from 'app/views/partials/entry/mark_as_read_form';

class EntriesView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'entries';
    }

    render() {
        super.render();

        this.attachChild(MarkAsReadFormView, 'form.feedr-mark-as-read');
        this.$('.feedr-form-action')
            .each((i, el) => {
                this.attachChild(FormActionView, this.$(el));
            });

        return this;
    }

    getTemplateData() {
        return { entries: this.collection.toJSON() };
    }
}

export default EntriesView;
