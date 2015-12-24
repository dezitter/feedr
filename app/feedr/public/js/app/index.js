import Backbone from 'backbone';

import Router from 'app/router';
import TemplateEngine from 'app/engine';

class App extends Backbone.Model {

    constructor(options) {
        super(options);

        this.router = new Router({
            app: this,
            routes: options.routes,
            $container: options.$container
        });

        this.templateEngine = new TemplateEngine({
            templates: options.templates
        });
    }

    start() {
        Backbone.history.start({ pushState: true });
    }

}

export default App;
