FROM ruby:2.3.1

RUN useradd jekyll

USER jekyll

WORKDIR /jekyll

COPY Gemfile /jekyll

RUN bundle

RUN /bin/bash
