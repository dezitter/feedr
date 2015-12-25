import superagent from 'superagent';

class Fetcher {

    fetch(endpoint, options, cb) {
        if (typeof cb !== 'function') {
            cb = options;
            options = {};
        }

        function onResponse(err, response) {
            if (err) { return cb(err); }

            cb(null, response.body);
        }

        superagent.get(endpoint)
                  .query(options.query)
                  .set('Accept', 'application/json')
                  .end(onResponse);
    }

}

export default Fetcher;
