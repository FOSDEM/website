FROM ruby:2.7
MAINTAINER ryan@slatehorse.com

# Install other dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
      pngcrush \
      imagemagick \
      krb5-user

# Copy the Gemfile in and bundle, so we have the dependencies cached
COPY Gemfile Gemfile.lock .
RUN gem install bundler:1.17.3 && bundle install

# Set encoding to prevent nanoc exploding
ENV LANG=C.UTF-8
ENV APP_DIR=/usr/src/app

# Port 3000 is used for `nanoc view`
EXPOSE 3000
WORKDIR $APP_DIR
ENTRYPOINT ["bundle", "exec"]

LABEL org.opencontainers.image.source https://github.com/FOSDEM/website
CMD ['nanoc', 'view']
