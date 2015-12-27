import CompositeView from './composite';
import AddFeedFormView from './partials/feed/add_form';

class FeedsView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'feeds';
    }

    render() {
        super.render();

        this.attachChild(AddFeedFormView, 'form.feedr-add-feed');

        return this;
    }

    getTemplateData() {
        return { feeds: this.collection.toJSON() };
    }
}

export default FeedsView;
