---
layout: default
title:  "Cheat sheet ruby"
date:   2016-04-09 15:35:44 +0200
permalink: cheat-sheet-ruby
tags: ruby
category: code decroissant
---

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