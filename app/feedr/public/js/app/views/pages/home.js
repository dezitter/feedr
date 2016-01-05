import AddFeedFormView from 'app/views/partials/feed/form/add';
import CompositeView from 'app/views/composite';
import FormActionView from 'app/views/partials/entry/form/action';

class HomeView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/home';
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
        return { entries: this.collection.toJSON() };
    }
}

export default HomeView;
