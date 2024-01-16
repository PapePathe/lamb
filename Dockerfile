# syntax=docker/dockerfile:1
FROM ruby:2.0
RUN echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" > /etc/apt/sources.list
RUN apt-get update -qq && apt-get install -f -y libmysqlclient-dev
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install --jobs 8 --verbose
COPY . .

EXPOSE 3000
CMD bundle exec rails s
