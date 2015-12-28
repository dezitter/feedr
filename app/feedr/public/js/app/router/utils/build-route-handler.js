import { compact } from 'underscore';
import { readRouteSpec } from './read-route-spec';

export function buildRoutehandler(router, route, spec) {
    return function routeHandler(...params) {
        let { action, Controller, View } = readRouteSpec(spec);
        let controller = new Controller({ app: router.app });

        router.trigger('route:start', route);
        controller[action].call(controller, ...compact(params))
                          .then(onResult)
                          .catch(onError);

        function onResult(result) {
            let view = new View({
                ...result,
                app: router.app
            });

            router.show(view);
            router.trigger('route:end', route);
        }

        function onError(err) {
            console.error(err);
        }
    };
}
