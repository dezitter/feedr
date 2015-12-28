import $ from 'jquery';

import App from './app';
import routes from './routes';
import templates from './templates';

import { hijackLinks } from './links/hijack-links';

let app = new App({
    routes,
    templates,
    $menu: $('#menu'),
    $container: $('#content')
});

hijackLinks(function(err, route) {
    app.router.navigate(route, { trigger: true });
});

app.start();
