FROM ruby:2.1
MAINTAINER ryan@slatehorse.com

# Install other dependencies
RUN apt-get update && apt-get install -y \
      pngcrush \
      imagemagick 

# Copy the Gemfile in and bundle, so we have the dependencies cached
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install

# Set encoding to prevent nanoc exploding
ENV LANG=C.UTF-8
ENV APP_DIR=/usr/src/app

# Copy the rest of the app in
ADD . $APP_DIR

# Port 3000 is used for `nanoc view`
EXPOSE 3000
WORKDIR $APP_DIR
ENTRYPOINT ["bundle", "exec"]
CMD ['nanoc', 'view']
