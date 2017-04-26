---
title: Ruby & Rails Cheatsheet
date: '2016-12-04 00:00:00'
layout: page
permalink: cheat-sheet-ruby
tags: [ruby, rails]
category: sustainable_code
---

Conseils à la volée pour écrire du meilleur code en ruby.

<!--more-->

## Rails starter

- [rails starter template](https://github.com/dennybritz/rails_startup_template ) : script qui permet d'installer des gems de bases, et certaines avec des conditions (nécessité de répondre à des questions pdt l'install)
- [Rails Composer](https://github.com/RailsApps/rails-composer) The Rails generator on steroids for starter apps


## Ressources

### Articles

- [Sandi Metz' Rules For Developers](https://robots.thoughtbot.com/sandi-metz-rules-for-developers)
- [Ruby on Rails, the iMenlo way](https://medium.com/imenlo/ruby-on-rails-the-imenlo-way-d29965618630#.ewxo0q9al)


### Bouquins

- [99 Bottles](https://www.sandimetz.com/99bottles/) - Sandi Metz


## Gems à tester

### Linting / Debug / DevOps

- [rubocop](https://github.com/bbatsov/rubocop) : A Ruby static code analyzer, based on the community Ruby style guide
- [pronto](https://github.com/mmozuras/pronto) : Quick automated code review of your changes
- [reek](https://github.com/troessner/reek) : Code smell detector for Ruby

- [overcommit](https://github.com/brigade/overcommit) : A fully configurable and extendable Git hook manager
- [whenever](https://github.com/javan/whenever) : Cron jobs in Ruby
- [ahoy](https://github.com/ankane/ahoy) : Simple, powerful visit tracking for Rails
- [turnout](https://github.com/biola/turnout) : Turnout makes it easy to put Rack apps into maintenance mode
- [brakeman](https://github.com/presidentbeef/brakeman) : A static analysis security vulnerability scanner for Ruby on Rails applications mode

### Utilities
- [kaminari](https://github.com/kaminari/kaminari) : A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps (à la place de will_paginate ?)
- [sitemap_generator)](https://github.com/kjvarga/sitemap_generator) : framework-agnostic XML Sitemap generator written in Ruby with automatic Rails integration. It supports Video, News, Image, Mobile, PageMap and Alternate Links sitemap extensions and includes Rake tasks for managing your sitemaps, as well as many other great features.
- [Json API rb](http://jsonapi-rb.org/) : Efficient and convenient JSON API library for ruby (upgrade de active model serializer, en gros)

## Divers

- Exposing your localhost to the Internet : https://www.sitepoint.com/adding-sms-capabilities-to-your-rails-app/#gist2970916


## do / don't

### Batch process

plutôt que

``` ruby
Post.where(published: true).each do |post|
  post.archive!
end
```

faire :

``` ruby
Post.where(published: true).find_each do |post|
  post.archive!
end
```

18 - Allow both single items AND arrays to be enumerated against

# [*items] converts a single object into an array with that single object
# of converts an array back into, well, an array again
[*items].each do |item|
  # ...
end
