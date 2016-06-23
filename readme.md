Marges
==============================

Tentatives pour un blog - test de Jekyll

## Comment ça marche ?


## Resources

### Themes sur lesquels garder un oeil

- https://mmistakes.github.io/hpstr-jekyll-theme/tags/ : comptage d'occurences de tags
- http://themeforest.net/item/writer-a-minimal-blog-for-jekyll/full_screen_preview/10562560 : mise en forme générale, css posts / categories


### General workflow

- https://borisschapira.com/2016/02/jekyll-codeship/
  - gemfile
  - i18n
  - vitesse lecture
  - moteur rendu markdown
  - précédent/suivant dans une meme categorie
  - node, gulp, browsersync
  - hooks github interfacé à caodeship (ac rspec)
  - html-proofer
  - accessibilité : 2 chargements fonts, abrr-touch
  - algolia
  - instantClick pour impression vitesse
  - content security policy avec log des infractions
- https://mademistakes.com/articles/using-jekyll-2016/
  - plugin jekyll-tagging-related_posts for related articles
  - improve build time : --incremental regeneration || Liquid Profiler
- https://github.com/mmistakes/made-mistakes-jekyll
- https://robwise.github.io/blog/jekyll-and-gulp
- clear tuto : http://theblog.unpixel.fr/2015-11-15-better-jekyll-workflow-with-gulp/

### Hosting

#### Github pages

- publishing source on github (useful for plugins) : https://gist.github.com/WouterJ/4945964
- https://community.nitrous.io/posts/using-jekyll-plugins-on-github-pages
- deploy a directory as a git branch : https://github.com/X1011/git-directory-deploy
- http://alexcican.com/post/guide-hosting-website-dropbox-github/
- https://www.sitepoint.com/jekyll-plugins-github/
- https://www.sitepoint.com/jekyll-plugins-github/
- http://tongueroo.com/articles/how-to-use-any-jekyll-plugins-on-github-pages-with-circleci/
- https://shitao.github.io/use-jekyll-plugin-on-gitpage/

#### Other host

- Surge ?
- https://5apps.com/deploy/home
- http://www.sitepoint.com/jekyll-plugins-github/
- https://www.pubstorm.com/
- codeship
- alwaysdata https://www.alwaysdata.com/fr/ (utilisé par Schapira)

### Automating

**with npm**

- http://jsforallof.us/2015/02/12/utilising-node-and-npm-for-front-end-development-workflow

**with rake**

- https://github.com/avillafiorita/jekyll-rakefile

### Plugins

- automatic tag page creation plugin : http://www.raymondcamden.com/2015/03/05/my-experience-working-with-jekyll/


### Diverses helpers

- get all tags : https://talk.jekyllrb.com/t/get-all-tags-uniques-in-multiple-collection-pages-without-a-plugin/1221/3
- faciliter post, publish, etc : https://github.com/jekyll/jekyll-compose

### Used resources

Design :

- http://webdesign.tutsplus.com/tutorials/how-to-make-responsive-scrollable-panels-with-flexbox--cms-23269

Process

- http://sarahcassady.com/2015/07/17/jekyll-on-github-pages/

### Liquid

``` liquid
<!-- Create empty arrays -->
{% assign tags = '' | split: ',' %}
{% assign unique_tags = '' | split: ',' %}

<!-- Map and flatten -->
{% assign article_tags =  site.articles | map: 'tags' | join: ',' | join: ',' | split: ',' %}
{% assign tutorial_tags =  site.tutorials | map: 'tags' | join: ',' | join: ',' | split: ',' %}

<!-- Push to tags -->
{% for tag in article_tags '%}
  {% assign tags = tags | push: tag %}
{% endfor %}
{% for tag in tutorial_tags '%}
  {% assign tags = tags | push: tag %}
{% endfor %}

<!-- Uniq -->
{% assign tags = tags | sort %}
{% for tag in tags %}

  <!-- If not equal to previous then it must be unique as sorted -->
  {% unless tag == previous %}

    <!-- Push to unique_tags -->
    {% assign unique_tags = unique_tags | push: tag %}
  {% endunless %}

  {% assign previous = tag %}
{% endfor %}
```

## Needs

- Priority high
  - plugins use

- priority medium
  - use jade !
  - ease of post (post title)

- priority low
  - es2015 ?
  - minification/uglification of my JavaScript files
  - browserSync
  - image optimization/resizing
  - styles autoprefixing
  - CI, automation, with jenkins (https://indefiniteloop.com/blog/code/jekyll-jenkins-blogging-on-the-go.html)

## A lire

- https://www.smashingmagazine.com/2016/05/content-first-prototyping/
-



