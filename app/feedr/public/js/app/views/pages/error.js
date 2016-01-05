import CompositeView from 'app/views/composite';

class ErrorView extends CompositeView {

    constructor(options) {
        super(options);
        this.templateName = 'pages/error';
    }

    getTemplateData() {
        return this.model.toJSON();
    }
}

export default ErrorView;
