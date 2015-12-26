import { compact } from 'underscore';
import { readRouteSpec } from './read-route-spec';

export function buildRoutehandler(router, spec) {
    return function(...params) {
        let { action, Controller, View } = readRouteSpec(spec);
        let controller = new Controller({
            app: router.app
        });

        controller[action].call(controller, ...compact(params), function(err, result) {
            if (err) { throw new Error(err); }

            let view = new View({
                ...result,
                app: router.app
            });

            router.show(view);
        });
    };
}
