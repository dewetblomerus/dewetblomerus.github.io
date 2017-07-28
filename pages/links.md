---
layout: page
permalink: /links/
---
[Calendar](https://calendar.google.com/calendar/render?pli=1#main_7){:target="_blank"}

[DevOps](http://devops.salesloft.com/){:target="_blank"}

[GitHub](https://github.com/pulls?utf8=%E2%9C%93&q=is%3Aopen+is%3Apr+label%3Abs){:target="_blank"}

[Gmail](https://gmail.com){:target="_blank"}

[Jira](https://salesloft.atlassian.net/secure/RapidBoard.jspa?rapidView=3&quickFilter=217){:target="_blank"}

[Okta](https://salesloft.okta.com/app/UserHome){:target="_blank"}

[Sumo](https://service.us2.sumologic.com/ui/bento.html#/workspace/default/search/view/600d6994_a887_6d39_3254_8ea35ee5bde5){:target="_blank"}

```
docker run -it --rm \
   --name dotfiles \
   -v /home/dewet/code:/home/dewet/code \
   -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
   -u dewet \
   registry.gitlab.com/dewetblomerus/dotfiles
```

`docker run -d --rm -v $(pwd):/srv/jekyll -p 80:4000 jekyll/jekyll jekyll serve --host=0.0.0.0`
