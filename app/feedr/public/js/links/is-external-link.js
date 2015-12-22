export function isExternalLink($a) {
    return $a.attr('href').startsWith('http');
}
