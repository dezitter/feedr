import api from 'app/api';

import BaseView from '../../base';

class AddFeedFormView extends BaseView {

    constructor(options) {
        super(options);

        this.events = {
            'submit': this.onSubmit
        };

        this.delegateEvents();
    }

    onSubmit(event) {
        event.preventDefault();

        let $input = this.$('input[type="url"]');
        let url = $input.val();

        api.post('/api/feed', { url })
           .then(() => {
               this.app.router.navigate('/feeds', { trigger: true });
           })
           .catch(err => { throw new Error(err); });
    }
}

export default AddFeedFormView;
