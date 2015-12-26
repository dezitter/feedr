import api from 'app/api';

class Fetcher {

    fetch(endpoint, options={}) {
        return api.get(endpoint, options.query);
    }
}

export default Fetcher;
