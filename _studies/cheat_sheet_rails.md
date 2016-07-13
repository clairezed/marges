---
layout: base
title:  "Cheat sheet ruby"
permalink: cheat-sheet-ruby
tags: [ruby, rails]
category: sustainable_code
---

Essaye de garder  tout ça en tete, Claire ! T'écriras du meilleur code !


## DONT / DO

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

- https://robots.thoughtbot.com/sandi-metz-rules-for-developers
- https://medium.com/imenlo/ruby-on-rails-the-imenlo-way-d29965618630#.ewxo0q9al