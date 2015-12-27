import _ from 'underscore';
import Backbone from 'backbone';

class BaseView extends Backbone.View {

    constructor(options) {
        super(options);

        this.children = [];
        this.app = options.app;
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

    render() {
        let context = this.getTemplateData();
        let html = this.renderTemplate(this.templateName, context);

        this.$el.html(html);

        return this;
    }

    getTemplateData() {
        return null;
    }

    renderTemplate(name, context) {
        if (!name) {
            throw new Error('Missing template name');
        }

        return this.app.templateEngine.render(name, context);
    }
}

export default BaseView;
