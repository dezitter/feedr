#!/bin/sh

SSL_DIR=./ssl
SSL_KEY_FILE=$SSL_DIR"/key.pem"
SSL_CERT_FILE=$SSL_DIR"/cert.pem"

rm -rf $SSL_DIR && mkdir $SSL_DIR

openssl req -x509          \
            -nodes         \
            -newkey        \
            rsa:2048       \
            -keyout        \
            $SSL_KEY_FILE  \
            -out           \
            $SSL_CERT_FILE \
            -days          \
            365            \

