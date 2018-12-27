FROM starefossen/ruby-node:2-10-stretch
RUN apt-get update -qq && \
    apt-get install -y nano build-essential libpq-dev && \
    gem install bundler
RUN mkdir /scavengerhunt
COPY Gemfile Gemfile.lock /scavengerhunt/
WORKDIR /scavengerhunt
RUN bundle install
COPY . /scavengerhunt
    