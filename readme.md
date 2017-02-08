Marges
==============================

Carnets de note en ligne

## Comment ça marche ?

La branche la plus à jour est la branche `source`. Lors du déploiement, cette branche est compilée, buildée, et le résultat du build (un site tout fait, donc) est pushé sur la branche gh-pages. Cette branche est celle qui sert à alimenter le site (hébergée en tant que page github).

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

### Used resources

Design :

-[How to Make Responsive, Scrollable Panels with Flexbox](http://webdesign.tutsplus.com/tutorials/how-to-make-responsive-scrollable-panels-with-flexbox--cms-23269)

Process

-[Jekyll on Github Pages with Plugins](http://sarahcassady.com/2015/07/17/jekyll-on-github-pages/)

### Design inspiration

Inspiration gardée sous le coude pour de futures évolutions

- http://lanyon.getpoole.com/
- https://github.com/andrewbanchich/editorial-jekyll-theme
- http://thehideout.co.uk/
- http://elbowsydney.com.au/what/
- https://makingmusic.ableton.com/
- https://www.siteinspire.com/websites/6557-google-fonts  https://fonts.google.com/
- http://jakebarry.us/ : for links
- http://www.thrivesolo.com/index.html
- http://themeforest.net/item/writer-a-minimal-blog-for-jekyll/full_screen_preview/10562560 : mise en forme générale, css posts / categories
- https://gitlab.com/political-revolution/political-revolution.gitlab.io
- https://wordpress.org/themes/tracks/
- REPERTOIRE : https://www.designernews.co/stories/54330-textonly-sites
- REPERTOIRE : http://www.webgeekly.com/inspiration/37-inspiring-examples-of-super-clean-text-based-website-designs/
- REPERTOIRE : https://www.typewolf.com/
- REPERTOIRE : https://www.siteinspire.com/websites?page=4
- REPERTOIRE : http://www.webgeekly.com/inspiration/37-inspiring-examples-of-super-clean-text-based-website-designs/

Text experiments (write a note !)
- http://www.fullstopnewparagraph.co.uk/
- http://greaterthanorequalto.net/


## Todo & needs

- Priority high
  - pagination
  - nommage automatique des fichiers/url en fonction du titre
  - search (algolia ? lunr ?)
  - check ssl
  - verif sitemap, referencement, rss
  - link target_blank

- priority medium
  - réorganiser sass (cf https://gitlab.com/political-revolution/political-revolution.gitlab.io/tree/master)
  - use jade !
  - ease of post (post title, post date)
  - mixer les categories et tags des depeches et dossiers
  - gérer facilement les liens internes (d'un article à l'autre)
  - améliorer l'affichage (markdown)

- priority low
  - es2015 ?
  - minification/uglification of my JavaScript files
  - browserSync
  - image optimization/resizing
  - styles autoprefixing
  - CI, automation, with jenkins (https://indefiniteloop.com/blog/code/jekyll-jenkins-blogging-on-the-go.html)
  - cloudinary

## A lire

- https://www.smashingmagazine.com/2016/05/content-first-prototyping/
-
