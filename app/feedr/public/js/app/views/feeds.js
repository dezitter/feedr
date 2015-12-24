import BaseView from './base';

class FeedsView extends BaseView {

    constructor(options) {
        super(options);
        this.templateName = 'feeds';
    }

    getTemplateData() {
        return { feeds: this.collection.toJSON() };
    }
}

export default FeedsView;
