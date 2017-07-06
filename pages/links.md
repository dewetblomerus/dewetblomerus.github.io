---
layout: page
permalink: /links/
---
[Calendar](https://calendar.google.com/calendar/render?pli=1#main_7){:target="_blank"}

[Okta](https://salesloft.okta.com/app/UserHome){:target="_blank"}

[Jira](https://salesloft.atlassian.net/secure/Dashboard.jspa){:target="_blank"}

[Gmail](https://gmail.com){:target="_blank"}

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
