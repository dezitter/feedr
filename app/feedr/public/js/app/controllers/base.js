class BaseController {

    constructor(options) {
        this.app = options.app;
    }

    fetch(url, options) {
        return this.app.fetcher.fetch(url, options);
    }
}

export default BaseController;
