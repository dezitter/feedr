import { readRouteSpec } from './read-route-spec';

export function buildRoutehandler(router, spec) {
    return function() {
        let { action, Controller, View } = readRouteSpec(spec);
        let controller = new Controller();

        controller[action].call(controller, function(err, result) {
            if (err) { throw new Error(err); }

            let view = new View({
                ...result,
                app: router.app
            });

            router.show(view);
        });
    };
}
