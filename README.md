# My Personal Website
You can visit the site [here](https://dewetblomerus.com/)

It is built with Jekyll and hosted for free on GitHub Pages

## Local Development

```
bundle install
jekyll serve
```

## Run in Docker

```
docker run -v "$(pwd)":/home/jekyll -p 4000:4000 -it jekylocal jekyll serve -H 0.0.0.0
```
