import CompositeView from './composite';
import AddFeedFormView from './partials/feed/add_form';

class HomeView extends CompositeView {

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
