import Backbone from 'backbone';

import ErrorView from 'app/views/pages/error';
import MenuView from 'app/views/menu';
import Fetcher from 'app/fetcher';
import Router from 'app/router';
import TemplateEngine from 'app/engine';

const LOAD_DELAY = 1000;

class App extends Backbone.Model {

    constructor(options) {
        super(options);

        this._loadTimer = null;
        this.$loader = options.$loader;
        this.$container = options.$container;

        this.fetcher = this.createFetcher();
        this.menuView = this.createMenuView(options);
        this.router = this.createRouter(options);
        this.templateEngine = this.createTemplateEngine(options);

        this.on('error', this.onError);
        this.listenTo(this.router, {
            'route:start': this.onRouteStart,
            'route:end': this.onRouteEnd,
            'error': this.onError
        });
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

    onRouteStart(link) {
        this.startLoadTimer();
        this.menuView.setActive(link);
    }

    onRouteEnd() {
        this.stopLoadTimer();
    }

    startLoadTimer() {
        this._loadTimer = window.setTimeout(this.showLoader.bind(this), LOAD_DELAY);
    }

    stopLoadTimer() {
        window.clearTimeout(this._loadTimer);
        this._loadTimer = null;

        this.hideLoader();
    }

    showLoader() {
        this.$loader.show();
        this.$container.addClass('loading');
    }

    hideLoader() {
        this.$loader.hide();
        this.$container.removeClass('loading');
    }

    onError(error) {
        let model = new Backbone.Model(error);
        let errorView = new ErrorView({
            app: this,
            model: model
        });

        console.error(error);

        this.router.show(errorView);
    }
}

export default App;
