import CompositeView from './composite';
import FormActionView from 'app/views/partials/entry/form_action';

class ArchiveView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'archive';
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
