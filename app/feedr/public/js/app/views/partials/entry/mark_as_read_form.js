import api from 'app/api';

import FormView from '../form';

class MarkAsReadFormView extends FormView {

    handleSubmit() {
        return api.post('/api/entries/mark-as-read')
                  .then(() => this.app.router.reload());
    }
}

export default MarkAsReadFormView;
