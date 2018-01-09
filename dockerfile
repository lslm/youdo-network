FROM ruby:2.4
MAINTAINER lucas.santos.silva2011@gmail.com.br

RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs \
  libssl-dev \
  libxrender-dev \
  wget \
  gdebi

RUN mkdir -p /youdo 
WORKDIR /youdo

COPY Gemfile Gemfile.lock ./ 
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./
