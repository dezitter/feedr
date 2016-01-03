import AddFeedFormView from './partials/feed/add_form';
import CompositeView from './composite';
import FormActionView from 'app/views/partials/entry/form_action';

class FeedsView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'feeds';
    }

    render() {
        super.render();

        this.attachChild(AddFeedFormView, 'form.feedr-add-feed');
        this.$('.feedr-form-action')
            .each((i, el) => {
                this.attachChild(FormActionView, this.$(el));
            });

        return this;
    }

    getTemplateData() {
        return { feeds: this.collection.toJSON() };
    }
}

export default FeedsView;
