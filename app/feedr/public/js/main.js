import App from './app';
import routes from './routes';

import { hijackLinks } from './links/hijack-links';

let app = new App({ routes });

hijackLinks(function(err, route) {
    app.router.navigate(route, { trigger: true });
});

app.start();
