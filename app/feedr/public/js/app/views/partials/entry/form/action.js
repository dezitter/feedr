import api from 'app/api';

import FormView from '../../form';

class FormActionView extends FormView {

    handleSubmit() {
        let action = this.$el.attr('action');
        let endpoint = action;

        return api.post(endpoint)
                  .then(() => this.app.router.reload());
    }
}

export default FormActionView;
