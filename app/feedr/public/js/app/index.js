import Backbone from 'backbone';

import MenuView from 'app/views/menu';
import Fetcher from 'app/fetcher';
import Router from 'app/router';
import TemplateEngine from 'app/engine';

class App extends Backbone.Model {

    constructor(options) {
        super(options);

        this.fetcher = this.createFetcher();
        this.menuView = this.createMenuView(options);
        this.router = this.createRouter(options);
        this.templateEngine = this.createTemplateEngine(options);

        this.listenTo(this.router, 'route', this.onRouteChange);
    }

    createMenuView(options) {
        return new MenuView({ el: options.$menu });
    }

    createFetcher() {
        return new Fetcher();
    }

    createRouter(options) {
        return new Router({
            app: this,
            routes: options.routes,
            $container: options.$container
        });
    }

    createTemplateEngine(options) {
        return new TemplateEngine({
            templates: options.templates
        });
    }

    start() {
        Backbone.history.start({ pushState: true });
    }

    onRouteChange(link) {
        this.menuView.setActive(link);
    }

}

export default App;
