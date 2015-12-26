import superagent from 'superagent';

import { promisify } from './utils/promisify';

class Api {

    static get(endpoint, query={}) {
        let request = superagent.get(endpoint)
                                .query(query)
                                .set('Accept', 'application/json');

        return promisify(request);
    }

}

export default Api;
