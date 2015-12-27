import BaseView from './base';
import AddFeedFormView from './partials/feed/add_form';

class FeedsView extends BaseView {

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
