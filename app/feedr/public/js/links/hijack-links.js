import $ from 'jquery';

import { handleClick } from './handle-click';

export function hijackLinks(callback) {
    $(document).on('click', 'a[href]', (event) => handleClick(event, callback));
}
