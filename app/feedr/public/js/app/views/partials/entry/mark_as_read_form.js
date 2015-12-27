import api from 'app/api';

import BaseView from '../../base';

class MarkAsReadFormView extends BaseView {

    constructor(options) {
        super(options);

        this.events = {
            'submit': this.onSubmit
        };

        this.delegateEvents();
    }

    onSubmit(event) {
        event.preventDefault();

        api.post('/api/entries/mark-as-read')
           .then(() => this.app.router.reload())
           .catch(err => console.error(err));
    }
}

export default MarkAsReadFormView;
