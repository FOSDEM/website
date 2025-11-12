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

1. Export the data from the FOSDEM Pretalx database
2. Generate the static site using the exported data

### Exporting from FOSDEM Pretalx

The schedule data is fetched as a large yaml file and the resources/thumbnails.
The best way is to clone these from the nanoc server (`nanoc update -y` should be repaired)

```bash
rsync nanoc@nanoc.fosdem.org:/srv/nanoc/website/export/ export -aP --delete-after
```

If you do not have access to the pretalx site or for, you can copy the `export/`
folder in the `sample/` directory to the root and go from there.

### Generating the site

> This section assumes you have an exported data from pretalx already. If you
> haven't please see the section above first.

```bash
nanoc
```

The site will be generated in `/output`. To view the website, you can use the
`view` command and optionally specify a port to listen on:

```bash
nanoc view -p 1234
```

Don't forget to add the year when you check out the site, eg http://localhost:1234/2024 .

### Running with Docker

Rather than installing all dependencies on you machine, it is also possible to use a docker container with all specific versions.

```bash
docker build -t fosdem/website .

# Export from Pentabarf
docker run --rm -it -v $(pwd):/usr/src/app:z fosdem/website kinit <username>@FOSDEM.ORG && nanoc update -y
# Generate the site
docker run --rm -v $(pwd):/usr/src/app:z fosdem/website nanoc

# Preview the site (at http://localhost:3000/2018)
docker run --rm -v $(pwd):/usr/src/app:z -p 3000:3000 fosdem/website nanoc view
```
