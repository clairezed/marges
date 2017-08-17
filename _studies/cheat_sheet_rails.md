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

## Architecture guidelines

Voir aussi les ressources architecture dans Ressources.

- **Models** : associations and constants (callbacks -> **service objects**, validations -> **Form objects**)
- **Controllers** : HTTP routing, parameters parsing, authentication, content negotiation, calling the right service or editor object, exception catching, response formatting, and returning the right HTTP status code. The remaining -> **service objects**.
- **Helpers** : used for utility methods. Otherwise -> **Decorators**
- Always pass one instance variable per view.

### Service objects

- Called from controller.
- replaces model callbacks
- Services should call **Query objects**, and should not store state. Use instance methods, not class methods. There should be very few public methods in keeping with SRP.

### Form objects

Replaces ActiveRecord models naming and validations for the model

- [Active model form objects](https://robots.thoughtbot.com/activemodel-form-objects), Thoughbot

### Value objects

- to keep your code cleaner and to group related attributes
- use cases : money, date range
- Value objects should have multiple attributes.
- Attributes should be immutable throughout the object’s life cycle.
- Equality is determined by the object’s attributes.
- []()

### Query objects

- Query object methods should return an object, a hash or an array, not an ActiveRecord association.

### Decorators / Delegators

- great way to use polymorphism — providing different implementations for different contexts or types, over-riding or sub-classing helpers.
- replaces concerns too ?
- for specific use cases : formatting model attributes for any kind of presentation logic.
- Keep them light and breezy.

## Ressources

### Articles

- [Sandi Metz' Rules For Developers](https://robots.thoughtbot.com/sandi-metz-rules-for-developers)
- [Ruby on Rails, the iMenlo way](https://medium.com/imenlo/ruby-on-rails-the-imenlo-way-d29965618630#.ewxo0q9al)

Architecture & POROs :

- [Building maintainable Rails Apps](http://andypike.com/blog/conferences/rubyc-2016/) : form objects, command objects, query objects, presenter objects
- [](https://www.toptal.com/ruby-on-rails/decoupling-rails-components)
- [7 Patterns to Refactor Fat ActiveRecord Models](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/)
- [Enhanced Ruby on Rails Architecture](https://github.com/CodeRocketCo/enhanced-rails-architecture) : concerns, helpers, form object, decorators, policies, publisher-listener ,services


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
- [rack-mini-profiler](https://github.com/MiniProfiler/rack-mini-profiler) : Profiler for your development and production Ruby rack apps.
- [bullet](https://github.com/flyerhzm/bullet) : help to kill N+1 queries and unused eager loading


### Utilities
- [kaminari](https://github.com/kaminari/kaminari) : A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps (à la place de will_paginate ?)
- [sitemap_generator)](https://github.com/kjvarga/sitemap_generator) : framework-agnostic XML Sitemap generator written in Ruby with automatic Rails integration. It supports Video, News, Image, Mobile, PageMap and Alternate Links sitemap extensions and includes Rake tasks for managing your sitemaps, as well as many other great features.

### API

- [Json API rb](http://jsonapi-rb.org/) : Efficient and convenient JSON API library for ruby (upgrade de active model serializer, en gros)
- [Json API serializers](https://github.com/fotinakis/jsonapi-serializers) : Pure Ruby readonly serializers for the JSON:API spec.

### Code structure

- [interactor](https://github.com/collectiveidea/interactor) : common interface for performing complex user interactions. (made by CollectiveIdea)
- [trailblazer](https://github.com/trailblazer/trailblazer) : A High-Level Architecture for Ruby.
- [draper](https://github.com/drapergem/draper) : Decorators/View-Models for Rails Applications
- [wisper](https://github.com/krisleech/wisper) : A micro library providing Ruby objects with Publish-Subscribe capabilities

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
## Git

Supprimer d'un repo un fichier gitignoré sur le tard et déjà pushé :
```bash
git rm --cached `git ls-files -i --exclude-from=.gitignore`
```

### Git commit standard

#### Mike Foley

- Line Length: All lines must be <= 72 chars (URLs excluded). First line should be <= 50 chars. Second line must be blank.
- Tense: Message must use imperative present tense: "Fix bug" and not "Fixed bug" or "Fixes bug."
- Subject Period: Do not end your subject line with a period.
- Capitalize Subject: Begin all subject lines with a capital letter.
- Frat House: No offensive content.
- WIP: Do not commit WIPs to shared branches (disabled by default)

Cf [Fit commit hook](https://github.com/m1foley/fit-commit#who-decided-these-rules)

Exemple :
```bash
git commit -m 'Init project' -m $'- Base gemfile\n- DB config'    
```

ce qui donne :
```
Init project

- Base gemfile
- DB config
```

Sources :
- [Tim Pope's blog](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
- [The official Git documentation](https://git.kernel.org/pub/scm/git/git.git/tree/Documentation/SubmittingPatches?id=HEAD)
- [Chris Beams](https://chris.beams.io/posts/git-commit/)
- Multiline from cli : [Coderwall](https://coderwall.com/p/-rlneg/multi-line-git-commit-message-from-cli)
