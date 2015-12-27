import BaseView from './base';
import AddFeedFormView from './partials/feed/add_form';

class HomeView extends BaseView {

    constructor(options) {
        super(options);
        this.templateName = 'home';
    }

    render() {
        super.render();

        this.attachChild(AddFeedFormView, 'form.feedr-add-feed');

        return this;
    }

    getTemplateData() {
        return { entries: this.collection.toJSON() };
    }
}

export default HomeView;
