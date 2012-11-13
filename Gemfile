# vim: set ts=2 sw=2 et noai ft=ruby:

# see http://gembundler.com/
#
# After modifying this file, delete Gemfile.lock
# and run `bundle'

source "http://rubygems.org"
gem "cri", "~>2.3.0"
gem "kramdown", "~>0.13.6"
#gem "nanoc", "~>3.4.0"
gem "nanoc", git: "https://github.com/ddfreyne/nanoc.git", branch: "release-3.4.x"
gem "nokogiri"
gem "image_size"
gem "rainpress"
gem "systemu"
gem "adsf"
gem "builder"
gem "activesupport"
gem "activerecord", "~>3.1.0"
gem "pg"
gem "erubis", "~>2.7.0"
gem "psych", "~>1.3.3"
gem "ruby-filemagic"
gem "htmlentities"
gem "bluecloth"
# we need git master here, implements colspan in tables:
gem "prawn", git: "git://github.com/prawnpdf/prawn", branch: "master"
gem "rmagick"
gem "rsolr"
gem "sinatra"
gem "sinatra-contrib"
gem "thin"
gem "net-ssh"
gem "net-ssh-gateway"

group :development do
    gem "awesome_print"

    gem "guard"

    # guard plugins:
    gem "guard-bundler"
    gem "guard-nanoc", git: "https://github.com/pbleser/guard-nanoc.git", branch: "master"

    # for guard filesystem event monitoring, see here:
    # https://github.com/guard/guard
    gem 'rb-inotify', :require => false
    gem 'rb-fsevent', :require => false
    gem 'rb-fchange', :require => false

    # for Growl notifications
    gem 'ruby_gntp'

    gem "libnotify", "~>0.1.3"

end
