import superagent from 'superagent';

import { promisify } from './utils/promisify';

class Api {

    static get(endpoint, query={}) {
        let request = superagent.get(endpoint)
                                .query(query)
                                .accept('application/json');

        return promisify(request);
    }

    static post(endpoint, params={}) {
        let request = superagent.post(endpoint)
                                .send(params)
                                .accept('application/json');

        return promisify(request);
    }

}

export default Api;
