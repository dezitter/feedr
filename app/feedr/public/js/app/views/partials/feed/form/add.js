import api from 'app/api';

import FormView from '../../form';

class AddFeedFormView extends FormView {

    handleSubmit() {
        let $input = this.$('input[type="url"]');
        let url = $input.val();

        return api.post('/feed', { url })
                  .then(() => {
                      this.app.router.navigate('/feeds', { trigger: true });
                  });
    }
}

export default AddFeedFormView;
