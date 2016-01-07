import AddFeedFormView from 'app/views/partials/feed/form/add';
import CompositeView from 'app/views/composite';
import FormActionView from 'app/views/partials/entry/form/action';

class HomeView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/home';
        this.children = {
            'form.feedr-add-feed': AddFeedFormView,
            'form.feedr-form-action': FormActionView
        };
    }

    getTemplateData() {
        return { entries: this.collection.toJSON() };
    }
}

export default HomeView;
