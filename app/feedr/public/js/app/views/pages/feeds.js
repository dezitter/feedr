import AddFeedFormView from 'app/views/partials/feed/form/add';
import CompositeView from 'app/views/composite';
import FormActionView from 'app/views/partials/entry/form/action';

class FeedsView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/feeds';
        this.children = {
            'form.feedr-add-feed': AddFeedFormView,
            'form.feedr-form-action': FormActionView
        };
    }

    getTemplateData() {
        return { feeds: this.collection.toJSON() };
    }
}

export default FeedsView;
