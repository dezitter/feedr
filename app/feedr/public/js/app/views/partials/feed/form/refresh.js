import api from 'app/api';

import FormView from '../../form';

class RefreshFormView extends FormView {

    handleSubmit() {
        return api.post('/feed/refresh')
                  .then(() => {
                      this.app.router.reload();
                  });
    }
}

export default RefreshFormView;
