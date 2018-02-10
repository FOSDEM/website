This repository holds the source code and content of the FOSDEM website (as of https://fosdem.org/).

FOSDEM is the Free and Open source Software Developers' European Meeting,
an event that is organized by the community for the community, as a non-for-profit.

Thousands of Open Source contributors from around the world meet every year in Brussels (Belgium)
to enjoy over 400 sessions and many occasions to chat and exchange.

Our website uses the nanoc static site generator, and we did implement a lot of custom
code to support our workflow as painlessly as possible.
Maybe some bits of those will be an inspiration or of help.

# Getting started

## Prerequisites

- Ruby 2.1.5
- ImageMagick >= 6.0 < 7.0
- pngcrush
- Either:
  1. An export of the FOSDEM pentabarf system; or
  2. Credentials to connect to the FOSDEM pentabarf database


## Building the site

A site build consists of two steps:

1. Export the data from the FOSDEM Pentabarf database
2. Generate the static site using the exported data

## Exporting from FOSDEM Pentabarf

To generate the schedule data from Pentabarf:

> Note: You will need to add your credentials for the pentabarf website.
>
> TODO: It appears you set the password in `config.yaml`, but there's probably a more elegant way that doesn't risk accidentally committing credentials to the git repo.

```bash
bundle exec nanoc update -y
```

## Generating the site

> This section assumes you have an exported data from pentabarf already. If you haven't please see the section below first.
> 
> If you've been provided with a dump of the Pentabarf system, place `pentabarf.yaml` and the `events` and `speaker` directories in the `/export` directory of this repository.

```bash
bundle exec nanoc
```

The site will be generated in `/output`.

> There are many ways to preview the site. One way is to use `http-server`:

```
# install if you don't have it already
yarn global add http-server
cd output 
http-server
```

## Dependency notes

### Ruby version

Ruby must be pinned at 2.1.5 because of the following requirements:

- The `json` dependency (v1.8.3) as of 2017-02-06) is not compatible with Ruby >= 2.4.0. ActiveSupport needs to be updated so its `json` dependency is bumped to >= 1.8.6 to gain support for Ruby 2.4 and greater.
- The `psych` gem fails on Ruby > 2.1.5.
- `prawn-2.0.3 requires ruby version >= 2.0.0, which is incompatible with the current version, ruby 1.9.3p551`

### ImageMagick version

`rmagick` v2.15.4 is not compatible with ImageMagick 7 and newer. Tested with ImageMagick 6.9.9-34 on OSX.

## Getting set up on OSX

> You may need to remove/unlink imagemagick if you have a newer version installed already.

```bash
brew install rbenv pngcrush imagemagick@6
rbenv install ruby-1.9.3-p551
```

# Testing upgrades

A good way to test ruby/dependency upgrades is to compare the output with a known-good output, e.g.:

```bash
# generate the reference output
git checkout master
bundle exec nanoc 
mv output output_reference

# generate the test output
git checkout my_changes_branch
bundle exec nanoc

# compare the two
diff -rq output output_reference
```