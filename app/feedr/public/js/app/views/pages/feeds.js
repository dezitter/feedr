import AddFeedFormView from 'app/views/partials/feed/form/add';
import CompositeView from 'app/views/composite';
import FormActionView from 'app/views/partials/entry/form/action';

class FeedsView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/feeds';
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
