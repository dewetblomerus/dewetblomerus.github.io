FROM ruby:2.3.1

EXPOSE 4000

RUN useradd -m jekyll

USER jekyll

WORKDIR /home/jekyll

COPY Gemfile /home/jekyll

RUN bundle -j7

RUN rm Gemfile*

CMD jekyll serve --host 0.0.0.0
