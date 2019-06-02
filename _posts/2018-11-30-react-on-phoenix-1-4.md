---
layout: post
title: Getting React set up on Phoenix 1.4
---

Phoenix 1.4 ships with Webpack by default so React is now 100% at home in your
next Phoenix project, here is how to get started. The goal of this guide is to
get one React component rendering, nothing more.

I was fumbling around until I found this
https://www.valentinog.com/blog/react-webpack-babel/

### Create your new Phoenix project and enter it

```shell
mix phx.new react_on_phoenix --no-ecto # Skipping the database to keep this guide as short as possible
cd react_on_phoenix
```

### Create a new Git repo and make your first commit.

I always do this immediately after running some generation command that I don't
want to have to run again.

```shell
git init
git add .
git commit -m 'initial commit'
```

### Pull in the dependencies

As show by https://www.valentinog.com/blog/react-webpack-babel/

```shell
cd assets # this is the front-end directory that was set up by Phoenix 1.4
npm i @babel/core babel-loader @babel/preset-env @babel/preset-react react react-dom --save-dev
```

### Delete the content of the following files and replace it with the specified code

As show by https://www.valentinog.com/blog/react-webpack-babel/

### `assets/.babelrc`

```json
{
  "presets": ["@babel/preset-env", "@babel/preset-react"]
}
```

### `assets/js/app.js`

```js
import React from 'react'
import ReactDOM from 'react-dom'

const ReactOnPhoenix = () => <div>This is a React Component!!!</div>

ReactDOM.render(<ReactOnPhoenix />, document.getElementById('mountPoint'))
```

### `lib/react_on_phoenix_web/templates/page/index.html.eex`

```html
<div id="mountPoint"></div>
```

## You probably want React Router to handle most routes

To do that, make a small change in `lib/react_on_phoenix_web/router.ex`

from

`get "/", PageController, :index`

to

`get "/*path", PageController, :index`

## Change out the test assertion about what should be on the page

### In this file `test/react_on_phoenix_web/controllers/page_controller_test.exs`

```elixir
# Change it from this
"Welcome to Phoenix!"

# To this
"mountPoint"
```

### The tests should now pass

```shell
mix test
```

### Get back to the root directory of the app and start the server

```shell
cd ..
mix phx.server
```

You should now see **This is a React Component!!!** on the page at
http://localhost:4000

You can see all the changes here
https://github.com/dewetblomerus/react-on-phoenix/commit/7f31bcf6228b4656b971bfb4dd0b8762d401da2a
