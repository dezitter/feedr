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
                err = (err.response && err.response.body) || err;
                this.app.trigger('error', err);
            });
    }

    handleSubmit() {
        throw new Error('Not implemented');
    }
}

export default FormView;
