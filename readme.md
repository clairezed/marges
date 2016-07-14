Marges
==============================

Tentatives pour un blog - test de Jekyll

## Comment ça marche ?

La branche al plus à jour est la branche `source`. Lors du déploiement, cette branche est compilée, buildée, et le résultat du build (un site tout fait, donc) est pushé sur la branche gh-pages. Cette branche est celle qui sert à alimenter le site (hébergée en tant que page github).

Lancer le serveur en local :

```bash
jekyll serve
```

Lister les commandes rake disponibles :

```bash
rake -T
```

Déployer en production :

```bash
rake git:deploy
```


## Resources

### Themes sur lesquels garder un oeil

- https://mmistakes.github.io/hpstr-jekyll-theme/tags/ : comptage d'occurences de tags
- http://themeforest.net/item/writer-a-minimal-blog-for-jekyll/full_screen_preview/10562560 : mise en forme générale, css posts / categories

Design inspiration

- https://wordpress.org/themes/scrawl/
- https://wordpress.org/themes/simplenotes/
- https://wordpress.org/themes/tracks/
- https://wordpress.org/themes/chunk/
- https://wordpress.org/themes/hexa/
- REPERTOIRE : https://www.designernews.co/stories/54330-textonly-sites
- REPERTOIRE : http://www.webgeekly.com/inspiration/37-inspiring-examples-of-super-clean-text-based-website-designs/
- REPERTOIRE : https://www.typewolf.com/
- REPERTOIRE : https://www.siteinspire.com/websites?page=4
- REPERTOIRE : http://www.webgeekly.com/inspiration/37-inspiring-examples-of-super-clean-text-based-website-designs/
- http://harvardlawreview.org/
- http://elbowsydney.com.au/what/
- https://makingmusic.ableton.com/
- https://www.siteinspire.com/websites/6557-google-fonts  https://fonts.google.com/
- http://v1.jontangerine.com/log/
- http://jakebarry.us/ : for links
- http://www.thrivesolo.com/index.html

Text experiments (write a note !)
- http://www.fullstopnewparagraph.co.uk/
- http://greaterthanorequalto.net/

Patterns :
http://lea.verou.me/css3patterns/#lined-paper
http://www.awwwards.com/background-patterns-designs-and-resources-for-websites.html
http://www.designbolts.com/2012/12/22/50-free-simple-white-seamless-patterns-for-website-backgrounds/


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
  - bundler
  - rsync task to deploy on own server
  - task to notify pingomatic, bing, google of changes
  - Jekyll-Assets plugin : cache busting and inlining assets + autoprefixer
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
  - ease of post (post title, post date)
  - pagination
  - updated_at on studies (dernière modification)
  - mixer les categories et tags des depeches et dossiers

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



