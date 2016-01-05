import CompositeView from 'app/views/composite';
import FormActionView from 'app/views/partials/entry/form/action';
import MarkAsReadFormView from 'app/views/partials/entry/form/mark_as_read';

class EntriesView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/entries/all';
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
