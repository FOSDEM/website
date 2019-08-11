#!/usr/bin/env ruby
#vim: set ts=2 sw=2 et ai ft=ruby:
# encoding: UTF-8

require 'sinatra'
enable :logging
set :environment, :staging
set :port, 4568
set :run, false
set :solr_url, 'http://127.0.0.1:8983/solr/production'
set :views, File.join(settings.root, 'layout')
set :results_per_page, 10

require 'rack/contrib'
require File.expand_path('searcher.rb', File.dirname(__FILE__))

run Sinatra::Application.run!
