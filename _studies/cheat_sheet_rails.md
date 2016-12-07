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

## Ressources

- [Sandi Metz' Rules For Developers](https://robots.thoughtbot.com/sandi-metz-rules-for-developers)
- [Ruby on Rails, the iMenlo way](https://medium.com/imenlo/ruby-on-rails-the-imenlo-way-d29965618630#.ewxo0q9al)