FROM ruby:2.7.2

RUN useradd -m jekyll

USER jekyll

WORKDIR /home/jekyll

COPY Gemfile /home/jekyll

RUN bundle

RUN rm Gemfile*

RUN /bin/bash
