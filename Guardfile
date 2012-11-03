# vim: set ts=2 sw=2 et ai ft=ruby:
# encoding: UTF-8
# https://github.com/guard/guard#readme

guard :bundler do
  watch 'Gemfile'
end

guard :nanoc do
  watch 'config.yaml'
  watch 'Rules'
  watch 'layouts/**/*'
  watch 'content/**/*'
  watch 'commands/**/*'
  watch 'lib/**/*'
end

