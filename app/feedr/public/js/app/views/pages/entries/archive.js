import CompositeView from 'app/views/composite';
import FormActionView from 'app/views/partials/entry/form/action';

class ArchiveView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/entries/archive';
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
        return { entries: this.collection.toJSON() };
    }
}

export default ArchiveView;
