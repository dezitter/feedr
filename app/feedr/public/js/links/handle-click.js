import $ from 'jquery';

import { shouldHijack } from './should-hijack';

export function handleClick(event, callback) {
    if (shouldHijack(event)) {
        event.preventDefault();

        let $a = $(event.currentTarget);
        let href = $a.attr('href');

        callback(null, href);
    }
}
