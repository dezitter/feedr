import Backbone from 'backbone';

class Router extends Backbone.Router {

    constructor(options) {
        super(options);
    }

    navigate(route, options) {
        let wasHandled = Backbone.history.navigate(route, options);

        if (!wasHandled) {
            throw new Error(`Unknown route ${route}`);
        }

        return wasHandled;
    }

}

export default Router;
