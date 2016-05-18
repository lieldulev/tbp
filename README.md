_You might wanted to search [tpb](thepiratebay.se) and mistyped._

# TBP
TheBoilerPlate is my own tiny server/client javascript boilerplate for building web apps. It is for my personal use, and you shouldn't expect me to add features to it (but bugfixes are always welcome). I've been using it for a while on my projects, and decided to extract it to it's own repo so I can reuse it as often as I want.

# What's inside.
- Client
  - My own homebrew client-side MVC framework (Routing, Controllers, Data Pipe and views based on handlebars).
  - Dependecies for [handlebars](handlebarsjs.com) (+Intl support), [JQuery](jquery.com), [Material Design Lite](getmdl.io) and the required assets.
  - My gulp configuration (including plumber, browserify, handlebars, wrap, stream, declare, concat and sass)
  - Folder structure and sample files for index.html, client.js, stylesheet, controllers, views (including default errors), etc. included.
- Server
  - Dependencies for axios, base-64, config, es6-promise, express (+request proxy), serve-static and utf8
  - Sample server.js that serves static files from `dist`.
- Setup Script
  - Because editing readme.md, package.json, index.html and other stuff manually is too much work.

# Why I use it.
**Sometimes I don't need bloated javascript frameworks to build a small web apps.**
Backbone, Angular, Meteor, Ember (and [others](http://todomvc.com/)) are great. Really. They are maintained, documented and keep changing. But I don't want my framework to keep changing on me. In most cases I don't need 90% of the features included or have the time to learn the new APIs.

**Because I'm opinionated.**
I know what I need and how I like doing it.
TBP requires me to stick to my own guidelines, without rethinking about the-best-way to implement the app everytime.
It allows me to write client-side only, or a mix of server (nodejs) and client side easily - they way I like it.

**Because why not?**
There is a reason why there are hundreds of [tiny libraries and frameworks](http://microjs.com/) out there. They are easy to write and while doing it you learn more.

# Why YOU should NOT use it.
Because I didn't write it for the public. It will probably won't do everything you need. It is not well documented. I don't want to add your feature(s). I don't know if I'll keep using it tomorrow, so you shouldn't expect support. There are better frameworks out there, [pick one](https://en.wikipedia.org/wiki/Comparison_of_JavaScript_frameworks).

# Instructions
No, I don't provide instructions, because you should not use it.

That being said - this is a tiny code base, you can figure it out.

# License
Copyright (c) 2016, Liel Dulev

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
