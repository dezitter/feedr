import BaseView from './base';

class MenuView extends BaseView {

    setActive(link) {
        this.clearActive();

        this.getItem(link)
            .addClass('active');
    }

    clearActive() {
        this.$('li').removeClass('active');
    }

    getItem(link) {
        return this.$(`a[href="/${link}"]`).parent();
    }

}

export default MenuView;
