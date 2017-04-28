---
layout: page
permalink: /links/
---
[Zendesk](https://gitlab.zendesk.com/agent/dashboard){:target="_blank"}

[Calendar](https://calendar.google.com/calendar/render?pli=1#main_7){:target="_blank"}

[GitLab Issues](https://gitlab.com/groups/gitlab-com/issues?scope=all&state=opened&utf8=%E2%9C%93&assignee_id=640106){:target="_blank"}

[GitLab ToDos](https://gitlab.com/dashboard/todos){:target="_blank"}

[Gmail](https://gmail.com){:target="_blank"}

[GitLab Packages](https://packages.gitlab.com/gitlab/gitlab-ee?filter=debs){:target="_blank"}

[Calendly Link](https://calendly.com/dewet/45){:target="_blank"}

[Zoom De Wet](https://gitlab.zoom.us/j/7755775577){:target="_blank"}

[Support Doc](https://docs.google.com/a/gitlab.com/document/d/1jwj5g0BIq3kTepw2-ZD9VSETs7Isf6YDHGzmYxmTt50/edit?usp=sharing){:target="_blank"}

[GitLab Doc](https://docs.google.com/document/d/1JiLWsTOm0yprPVIW9W-hM4iUsRxkBt_1bpm3VXV4Muc/edit){:target="_blank"}

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
