import BaseView from './base';

class FeedsView extends BaseView {

    constructor(options) {
        super(options);
        this.templateName = 'feed';
    }

    getTemplateData() {
        return { feed: this.model.toJSON() };
    }
}

export default FeedsView;
