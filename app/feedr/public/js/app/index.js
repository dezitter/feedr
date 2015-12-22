import Backbone from 'backbone';

import Router from 'app/router';

class App extends Backbone.Model {

    constructor(options) {
        super(options);

        this.router = new Router(options);
    }

    start() {
        Backbone.history.start({ pushState: true });
    }

}

export default App;
