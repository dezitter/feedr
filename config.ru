require 'rubygems'
require 'bundler/setup'

Bundler.require
Dotenv.load

$LOAD_PATH.unshift File.expand_path('../app', __FILE__)

require 'feedr'
run Feedr::App
