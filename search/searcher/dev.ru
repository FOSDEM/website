#!/usr/bin/env ruby
#vim: set ts=2 sw=2 et ai ft=ruby:
# encoding: UTF-8
require 'sinatra'
enable :logging
set :environment, :development
set :port, 4567
set :run, false
set :solr_url, 'http://127.0.0.1:8983/solr'
set :views, File.join(settings.root, '../../output/searcher')
set :results_per_page, 10

require './searcher'
run Sinatra::Application

