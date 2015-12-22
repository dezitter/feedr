import $ from 'jquery';

import { isExternalLink } from './is-external-link';
import { shouldBypass } from './should-bypass';

export function shouldHijack(event) {
    let $a = $(event.currentTarget);

    return !event.ctrlKey
    &&     !event.metaKey
    &&     !event.shiftKey
    &&     !isExternalLink($a)
    &&     !shouldBypass($a);
}
