---
layout: page
title:  "Cheat sheet ruby et Rails"
permalink: cheat-sheet-ruby
tags: [ruby, rails]
category: sustainable_code
---

Essaye de garder tout ça en tete, Claire ! T'écriras du meilleur code !

<!--more-->

## do / don't

### Batch process

plutot que

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

## Ressources

- [Sandi Metz' Rules For Developers](https://robots.thoughtbot.com/sandi-metz-rules-for-developers)
- [Ruby on Rails, the iMenlo way](https://medium.com/imenlo/ruby-on-rails-the-imenlo-way-d29965618630#.ewxo0q9al)