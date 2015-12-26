import  { Promise } from 'es6-promise';
import superagent from 'superagent';

class Fetcher {

    fetch(endpoint, options={}) {
        return new Promise((resolve, reject) => {
            superagent.get(endpoint)
                      .query(options.query)
                      .set('Accept', 'application/json')
                      .end(onResponse);

            function onResponse(err, response) {
                if (err) { return reject(err); }

                resolve(response.body);
            }
        });
    }
}

export default Fetcher;
