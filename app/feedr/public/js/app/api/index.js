import superagent from 'superagent';

import { promisify } from './utils/promisify';

class Api {

    static get(endpoint, options={}) {
        let request = superagent.get(endpoint)
                                .query(options.query)
                                .set('Accept', 'application/json');

        return promisify(request);
    }

}

export default Api;
