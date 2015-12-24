import BaseView from './base';

class HomeView extends BaseView {

    constructor(options) {
        super(options);
        this.templateName = 'home';
    }

    getTemplateData() {
        return { entries: this.collection.toJSON() };
    }
}

export default HomeView;
