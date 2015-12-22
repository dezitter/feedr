import _ from 'underscore';
import Backbone from 'backbone';

class Router extends Backbone.Router {

    constructor(options) {
        super(_.omit(options, 'routes'));

        this.registerRoutes(options.routes);
    }

    navigate(route, options) {
        let wasHandled = Backbone.history.navigate(route, options);

        if (!wasHandled) {
            throw new Error(`Unknown route ${route}`);
        }

        return wasHandled;
    }

    registerRoutes(routes={}) {
        Object.keys(routes)
              .forEach((route) => this.registerRoute(route, routes[route]));
    }

    registerRoute(route, spec) {
        const action = spec.action;
        const Controller = spec.controller;

        this.route(route, function() {
            let controller = new Controller();
            controller[action].call(controller);
        });
    }

}

export default Router;
