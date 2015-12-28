import _ from 'underscore';
import Backbone from 'backbone';

import { buildRoutehandler } from './utils/build-route-handler';

class Router extends Backbone.Router {

    constructor(options) {
        super(_.omit(options, 'routes'));

        this.currentView = null;
        this.app = options.app;
        this.$container = options.$container;

        this.registerRoutes(options.routes);
    }

    navigate(route, options) {
        let wasHandled = Backbone.history.navigate(route, options);

        if (wasHandled === undefined) {
            Backbone.history.loadUrl(route);
        } else if (wasHandled === false) {
            throw new Error(`Unknown route ${route}`);
        }

        return wasHandled;
    }

    reload() {
        let route = Backbone.history.getFragment();
        return Backbone.history.loadUrl(route);
    }

    registerRoutes(routes={}) {
        Object.keys(routes)
              .forEach((route) => this.registerRoute(route, routes[route]));
    }

    registerRoute(route, spec) {
        this.route(route, route, buildRoutehandler(this, route, spec));
    }

    show(view) {
        if (this.currentView != null) {
            this.currentView.remove();
        }

        this.currentView = view;
        this.$container.html(view.render().$el);
    }
}

export default Router;
