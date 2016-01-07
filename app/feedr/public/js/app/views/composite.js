import _ from 'underscore';
import BaseView from './base';

function attachChildren(view) {
    Object.keys(view.children).forEach(function(selector) {
        let ViewCtor = view.children[selector];

        view.$(selector).each((i, el) => {
            view.attachChild(el, ViewCtor);
        });
    });
}

class CompositeView extends BaseView {

    constructor(options) {
        super(options);

        this.children = {};
        this._children = [];
    }

    remove() {
        _.invoke(this.children, 'remove');

        this._children = [];

        return super.remove();
    }

    attachChild(el, ViewCtor) {
        let view = new ViewCtor({
            app: this.app,
            el: el
        });

        this._children.push(view);

        return this;
    }

    render() {
        super.render();
        attachChildren(this);
        return this;
    }
}

export default CompositeView;
