import BaseView from '../base';

class FormView extends BaseView {

    constructor(options) {
        super(options);

        this.events = {
            'submit': this.onSubmit
        };

        this.delegateEvents();
    }

    onSubmit(event) {
        event.preventDefault();

        this.handleSubmit()
            .catch(err => {
                this.app.trigger('error', err.response.body);
            });
    }

    handleSubmit() {
        throw new Error('Not implemented');
    }
}

export default FormView;
