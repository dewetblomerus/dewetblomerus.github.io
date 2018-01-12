---
layout: page
permalink: /links/
---
[Backlog](https://salesloft.atlassian.net/secure/RapidBoard.jspa?rapidView=3&projectKey=SL&view=planning.nodetail&quickFilter=83){:target="_blank"}

[Book Recommendations](https://trello.com/b/7ewcVqv3/cultue-of-learning){:target="_blank"}

[Calendar](https://calendar.google.com/calendar/render?pli=1#main_7){:target="_blank"}

[Jira](https://salesloft.atlassian.net/secure/RapidBoard.jspa?rapidView=70&projectKey=ISE&selectedIssue=ISE-15){:target="_blank"}

[Jira Old Bikeshedders](https://salesloft.atlassian.net/secure/RapidBoard.jspa?rapidView=3&quickFilter=217){:target="_blank"}

[GitHub My PRs](https://github.com/pulls?utf8=%E2%9C%93&q=is%3Aopen+is%3Apr+author%3Adewetblomerus){:target="_blank"}

[GitHub Review PRs](https://github.com/pulls?utf8=%E2%9C%93&q=is%3Aopen+is%3Apr+is%3Aprivate+label%3A%22ready+for+review%22+review%3Arequired){:target="_blank"}

[PairingForm](https://goo.gl/forms/NT6ZQQNYIMNUg8V43){:target="_blank"}

[Professional Development Initiative](https://docs.google.com/a/salesloft.com/forms/d/e/1FAIpQLSdgZzTPwA2CejT0XLt1WVjtd0InwZ7WG705UjtEb2CER-U56Q/viewform){:target="_blank"}

[DeleteSession](chrome://settings/content/cookies){:target="_blank"}

[DevOps](http://devops.salesloft.com/){:target="_blank"}

[Gmail](https://gmail.com){:target="_blank"}

[K8S QA Process](https://salesloft.atlassian.net/wiki/spaces/DEVOPS/pages/82378753/Kubernetes+QA+FAQ){:target="_blank"}

[Sumo](https://service.us2.sumologic.com/ui/bento.html#/workspace/default/search/view/600d6994_a887_6d39_3254_8ea35ee5bde5){:target="_blank"}

[Okta](https://salesloft.okta.com/app/UserHome){:target="_blank"}

[Q4 Personal Goals](https://github.com/dewetblomerus/public-notes/issues/1){:target="_blank"}

[QA TracerBullet](https://tracer-bullet.qasalesloft.com/){:target="_blank"}

[QA Melody](https://accounts.qasalesloft.com/sign_in){:target="_blank"}

[QA2 Melody](https://accounts2.qasalesloft.com/sign_in){:target="_blank"}

[Strategic Initiatives](https://trello.com/b/QFl0QulQ/strategic-initiative-programs-v2){:target="_blank"}

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

`docker run -d --rm -v $(pwd):/srv/jekyll -p 80:4000 jekyll/jekyll jekyll serve --host 0.0.0.0`
