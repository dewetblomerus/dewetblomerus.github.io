FROM ruby:2.3.1

RUN useradd -m jekyll

USER jekyll

WORKDIR /home/jekyll

COPY Gemfile /home/jekyll

RUN bundle -j7

RUN rm Gemfile*

RUN /bin/bash
