---
layout: post
title: Read this before using Create React App with Rails
---

If you are reading this, you probably appreciate that Rails lets you follow some
conventions and everything just works. Instead of spending time configuring
development tools, you prefer to add cool features to your app. This means you
probably thought Create React App was a no-brainer as soon as you heard about
it. No configuring webpack or any build process anything, just use the CLI and
start writing React code. Before you set off on a multi-hour journey of getting
these two to work together, read this.

There are several well-documented ways of implementing React on Rails.

Unfortunately most of them include some kind of Gem like
[Webpacker](https://github.com/rails/webpacker)
[React on Rails](https://github.com/shakacode/react_on_rails) or
[React Rails](https://github.com/reactjs/react-rails)

Gems are great. But if you build something sufficiently complex in your
front-end React code, sooner or later, you will ask someone for help. It would
make sense to pick a specialist that spend all their time in front-end
Javascript and React code. What do you think they are going to say when they try
to take a quick look at your build process config and they realize there are
Ruby gems involved in the process? Okay, maybe they are nice like the JS
developers I know and they try lovingly start reading the documentation for the
Gem to figure out what it is doing. But I bet you they would be thinking "Why
the hell is a Ruby library involved in building this React app? And why is the
Asset Pipeline involved?". This should have nothing to-do with Ruby or Rails.

Another approach is to just handle the React and Rails apps as completely
separate applications. In the root of your project, do a `rails create server`
and `create-react-app client` then you can either host them separately with
Rails only being an api. In development you would start two servers, visit the
CreateReactApp on it's port and configure it to communicate with the Rails api
back-end. In production you could host them separately or build a Docker image
that has the `yarn build` output from the React app in the `/public` folder of
the Rails app and the Rails app serve it from there.

This approach works. I really like the simplicity because you are on the
happy-path of following all the conventions for both ecosystems.

Unfortunately the app I am building needs to have the back-end handling
Authentication. We want the back-end to authenticate you if you are not signed
in and hand your browser a session-cookie. This process includes redirecting the
user's browser to a 3rd party SSO provider. The above approach doesn't work for
this, because in development, your browser is hitting the Webpack Dev Server
directly and Rails never gets a direct browser request I guess I could have
tried to dig deeper here to see if I can get the redirect to happen or we could
have considered changing the requirements and implemented all kinds of security
in the front-end. But remember, this whole journey started with a desire for
"Happy path, minimal configuration, Get to writing code". So I moved on.

Here is what I spent several hours trying to get working before I quit:

1.  `rails new rails-react --skip-sprockets #this skips the asset pipeline`
1.  `cd rails-react`
1.  `git add .`
1.  `git commit -m 'initial rails'`
1.  `create-react-app client`
1.  `#a lot more steps here, get in touch if you want to take this further`

Where this is going is a **Create React App** application that is self contained
but Rails serves it to you.

I thought it was brilliant, and I was probably correct.

Rails would start up, I would tell it to serve static assets, I would tell it
that the static assets are hosted where the Webpack Dev Server is running the
**create-react-app** code. And it would load.

The poop hit the fan right at hot reloading. The **Webpack Dev Server** setup
has the browser open a web socket to the dev server listening for a change, and
if there is a change, the browser would reload the whole page. You can view this
in your **Network** tab of Chrome dev tools. The problem was that while Rails
was serving you the JS, and I could configure Rails to go get it from the WDS,
but the JS itself tried to open the socket, and it would request to open that
socket to the Rails server on port 3000 instead of the WDS which I had running
on port 3001. This is not configurable with the current version of CRA. I looked
into several ways of messing with it, but ultimately decided against it.

In the end, I went with a minimal `webpack.config.json` in the root of the app
that starts a **WDS** and serves a React app I am building in `/client`. The
reason this does work is because the **WDS** can be configured with a
`PUBLIC_PATH` which the JS code then uses to hit the **WDS** instead of just
using the server they were served from (which is Rails).

You will need the following in your `development.rb` and `production.rb`:

```
  # This lets Rails serve the Javascript as if it is a static asset sitting on a CDN somewhere
  config.public_file_server.enabled = true
```

You will need a `<%= javascript_include_tag(asset_url_for('js')) %>` in your
`app/views/layouts/application.html.erb`

This means your browser will load the JS when you try to load the Rails app.
This asset URL will probably be different between Development and Production.

And lastly a normal Rails view that only contains `<div id="root"></div>` and
then the React app uses that as a target to load itself into.

Feel free to get in touch if you have any questions.
