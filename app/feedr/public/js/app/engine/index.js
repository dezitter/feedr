import Handlebars from 'handlebars';

class TemplateEngine {

    constructor(options) {
        this.templates = options.templates;

        this.registerPartials();
    }

    render(name, context) {
        let template = this.compile(name);
        return template(context);
    }

    compile(name) {
        let source = this.getSource(name);
        return Handlebars.compile(source);
    }

    getSource(name) {
        if (this.templates[name] === undefined) {
            throw new Error(`Template "${name}" not found !`);
        }

        return this.templates[name];
    }

    registerPartials() {
        Object.keys(this.templates)
              .filter(name => this.isPartial(name))
              .forEach(name => {
                  Handlebars.registerPartial(name, this.getSource(name));
              });
    }

    isPartial(name) {
        return name.startsWith('partials');
    }
}

export default TemplateEngine;
