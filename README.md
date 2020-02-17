This repository holds the source code and content of the FOSDEM website (as of
https://fosdem.org/).

Our website uses the nanoc static site generator, and we did implement a lot of
custom code to support our workflow as painlessly as possible. Maybe some bits
of those will be an inspiration or of help.

# Getting started

## Prerequisites

- Ruby 2.4 or newer
- ImageMagick >= 6.0 < 7.0
- pngcrush
- Either:
  1. An export of the FOSDEM pentabarf system; or
  2. Credentials to connect to the FOSDEM pentabarf database

### Debian 9 with rbenv

Assuming you are running Debian or a derivative thereof, your system will need
to have the following packages installed:

- autoconf
- bison
- build-essential
- git
- libffi-dev
- libgdbm-dev
- libmagickcore-dev
- libmagickwand-dev
- libncurses5-dev
- libpq-dev
- libreadline6-dev
- libssl1.0-dev
- libyaml-dev
- pngcrush
- zlib1g-dev

Following the steps below should result in a working environment:

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

source ~/.bashrc

rbenv install 2.7.0
rbenv rehash
rbenv local 2.7.0

gem install bundler -v 1.17.3 # we’ll upgrade to Bundler 2.x soon

git clone git@git.fosdem.org:website.git

cd website/

git remote add github git@github.com:FOSDEM/website.git

bundle install

source ~/.bashrc
```

Of course, if you're not using `bash`, replace `.bashrc` with the appropriate
initialisation file for your shell.

## Building the site

A site build consists of two steps:

1. Export the data from the FOSDEM Pentabarf database
2. Generate the static site using the exported data

### Exporting from FOSDEM Pentabarf

To generate the schedule data from Pentabarf, you will first need to obtain a
Kerberos ticket for a principal with access to the Pentabarf database. Next,
you will be able to run the update command.

```bash
kinit yourprincipal@FOSDEM.ORG
nanoc update -y
```

### Generating the site

> This section assumes you have an exported data from pentabarf already. If you
> haven't please see the section below first.
>
> If you've been provided with a dump of the Pentabarf system, place
> `pentabarf.yaml` and the `events` and `speaker` directories in the `/export`
> directory of this repository.

```bash
nanoc
```

The site will be generated in `/output`. To view the website, you can use the
`view` command and optionally specify a port to listen on:

```
nanoc view -p 1234
```

## Dependency notes

### ImageMagick version

`rmagick` v2.15.4 is not compatible with ImageMagick 7 and newer. Tested with
ImageMagick 6.9.9-34 on OSX.

## Getting set up on OSX

> You may need to remove/unlink imagemagick if you have a newer version installed already.

```bash
brew install rbenv pngcrush imagemagick@6
rbenv install ruby-1.9.3-p551
```
