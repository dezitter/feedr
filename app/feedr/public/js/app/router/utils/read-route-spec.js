export function readRouteSpec(spec) {
    return {
        Controller: spec.controller,
        View: spec.view,
        action: spec.action
    };
}
