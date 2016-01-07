import CompositeView from 'app/views/composite';
import FormActionView from 'app/views/partials/entry/form/action';

class FeedView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/feed';
        this.children = {
            'form.feedr-form-action': FormActionView
        };
    }

    getTemplateData() {
        return { feed: this.model.toJSON() };
    }
}

export default FeedView;
