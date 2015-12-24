import Backbone from 'backbone';

class BaseView extends Backbone.View {

    constructor(options) {
        super(options);

        this.app = options.app;
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
