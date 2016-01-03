import CompositeView from './composite';

class ErrorView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'error';
    }

    getTemplateData() {
        return this.model.toJSON();
    }
}

export default ErrorView;
