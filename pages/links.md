---
layout: page
permalink: /links/
---

[Backlog](https://salesloft.atlassian.net/secure/RapidBoard.jspa?rapidView=3&projectKey=SL&view=planning.nodetail&quickFilter=83){:target="\_blank"}

[Book Recommendations](https://trello.com/b/7ewcVqv3/cultue-of-learning){:target="\_blank"}

[Calendly](https://calendly.com/dewet/30min){:target="\_blank"}

[Codeship Builds Melody](https://app.codeship.com/projects/19477){:target="\_blank"}

[DeleteSession](chrome://settings/content/cookies){:target="\_blank"}

[DevOps](http://devops.salesloft.com/){:target="\_blank"}

[GitHub My PRs](https://github.com/pulls?utf8=%E2%9C%93&q=is%3Aopen+is%3Apr+author%3Adewetblomerus){:target="\_blank"}

[GitHub Review PRs](https://github.com/pulls?utf8=%E2%9C%93&q=is%3Aopen+is%3Apr+is%3Aprivate+label%3A%22ready+for+review%22+review%3Arequired){:target="\_blank"}

[Jira](https://salesloft.atlassian.net/secure/RapidBoard.jspa?rapidView=70&quickFilter=275){:target="\_blank"}

[Professional Development Initiative (PDI)](https://docs.google.com/a/salesloft.com/forms/d/e/1FAIpQLSdgZzTPwA2CejT0XLt1WVjtd0InwZ7WG705UjtEb2CER-U56Q/viewform){:target="\_blank"}

[PropertyBoss](https://propertyboss.net/OwnerPortalv17?customer=fin001_123682){:target="\_blank"}

[Rhythm / SalesLoft Components](https://github.com/SalesLoft/rhythm/tree/master/packages){:target="\_blank"}

[SalesLoft Private NPM](https://npms.salesloft.com/#/){:target="\_blank"}

[Switchboard Designs](https://salesloft.invisionapp.com/share/B2KFBQZHNJV#/screens/301798922){:target="\_blank"}

[Wes Bos Courses](https://courses.wesbos.com/account){:target="\_blank"}

[Zoom Personal](https://salesloft.zoom.us/my/dewetb){:target="\_blank"}

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
