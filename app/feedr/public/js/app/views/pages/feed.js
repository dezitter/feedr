import CompositeView from 'app/views/composite';
import FormActionView from 'app/views/partials/entry/form/action';

class FeedView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/feed';
    }

    render() {
        super.render();

        this.$('.feedr-form-action')
            .each((i, el) => {
                this.attachChild(FormActionView, this.$(el));
            });

        return this;
    }

    getTemplateData() {
        return { feed: this.model.toJSON() };
    }
}

export default FeedView;
