#!/bin/sh

if ! test -f $1;
then
    echo 'Missing configuration file';
    exit 1;
fi

bundle exec thin -C $1 start
