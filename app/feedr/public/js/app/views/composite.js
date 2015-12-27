import _ from 'underscore';
import BaseView from './base';

class CompositeView extends BaseView {

    constructor(options) {
        super(options);

        this.children = [];
    }

    remove() {
        _.invoke(this.children, 'remove');

        this.children = [];

        return super.remove();
    }

    attachChild(ViewCtor, selector, options={}) {
        let view = new ViewCtor(Object.assign({
            app: this.app,
            el: this.$(selector)
        }, options));

        this.children.push(view);

        return this;
    }
}

export default CompositeView;
