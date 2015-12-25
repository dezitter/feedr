class BaseController {

    constructor(options) {
        this.app = options.app;
    }

    fetch(url, options, cb) {
        this.app.fetcher.fetch(url, options, cb);
    }
}

export default BaseController;
