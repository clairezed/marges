---
title: Jekyll workflow
date: '2016-12-04 00:00:00'
layout: page
permalink: jekyll-workflow
tags: [jekyll]
category: sustainable_code
---

Quelques ressources, commandes ou réflexion pour me permettre de mieux utiliser jekyll.

<!--more-->

<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Ressources générales](#ressources-gnrales)
- [Exemples de workflows](#exemples-de-workflows)
	- [Utilisateurs](#utilisateurs)
	- [Rake](#rake)
	- [Gulp](#gulp)
- [Par thématiques](#par-thmatiques)
	- [Performance](#performance)
	- [Hosting](#hosting)
		- [Github pages](#github-pages)
		- [Other host](#other-host)
- [CMS](#cms)
- [Plugins et services](#plugins-et-services)
- [Templates](#templates)
- [Divers](#divers)

<!-- /TOC -->

## Ressources générales

- [Jekyll tips](http://jekyll.tips/) : tutoriaux, plugins et services s'intégrant à Jekyll
- [The new dynamic](https://www.thenewdynamic.org/) : plein d'articles sur les sites statiques, serverless, etc

## Exemples de workflows

### Utilisateurs

- MadeMistakes :
	- [How I’m Using Jekyll in 2016](https://mademistakes.com/articles/using-jekyll-2016/) : plugin jekyll-tagging-related_posts for related articles, improve build time : --incremental regeneration || Liquid Profiler, bundler, rsync task to deploy on own server, task to notify pingomatic, bing, google of changes, Jekyll-Assets plugin : cache busting and inlining assets + autoprefixer
	- [Repos github](https://github.com/mmistakes?tab=repositories)
	- [Repo github principal](https://github.com/mmistakes/made-mistakes-jekyll)
- Andrew Banchich :
	- [gitlab repo](https://gitlab.com/users/andrewbanchich/projects)
	- cf [political revolution repo](https://gitlab.com/political-revolution/political-revolution.gitlab.io/tree/master) : Jekyll, Sass, React, and Webpack.
- Boris Schapira :
	- [Un blog avec Jekyll et Codeship](https://borisschapira.com/2016/02/jekyll-codeship/), février 2016 : gemfile, i18n, vitesse lecture, moteur rendu markdown, précédent/suivant dans une meme categorie, node, gulp, browsersync, hooks github interfacé à caodeship (ac rspec), html-proofer, accessibilité : 2 chargements fonts, abrr-touch, algolia, instantClick pour impression vitesse, content security policy avec log des infractions
	- [Repo github](https://github.com/borisschapira/borisschapira.com)

### Rake

- [Rakefile to simplify management of a Jekyll website](https://github.com/avillafiorita/jekyll-rakefile), repo github, aout 2015

### Gulp

- [Jekyll workflow with Gulp](https://codegaze.github.io/2016/01/09/a-jekyll-workflow-with-gulp/), janv 2016
- [Integrating Gulp into Your Jekyll Workflow](https://robwise.github.io/blog/jekyll-and-gulp), aout 2015

## Par thématiques

### Performance

- [Optimiser les performances et la sécurité avec Cloudflare](https://medium.com/@JeremyRaffin/site-web-statique-optimis%C3%A9-avec-github-pages-partie-3-optimiser-les-performances-et-la-s%C3%A9curit-2be5413b7b17#.i1p2gx6nw)
- [Optimizing jekyll with gulp](http://savaslabs.com/2016/10/19/optimizing-jekyll-with-gulp.html, oct 2016
- [Performant Websites with Jekyll, Grunt, GitHub Pages, and CloudFlare](http://davidensinger.com/2015/01/performant-websites-with-jekyll-grunt-github-pages-and-cloudflare/), janv 2015
- [13 STEPS TO A FASTER JEKYLL WEBSITE](https://wiredcraft.com/blog/make-jekyll-fast/), mai 2016

### images

[jekyll-srcset](https://github.com/netlify/jekyll-srcset) plugin : Dead simple responsive images for jekyll

### Hosting

#### Github pages

- [deploy a directory as a git branch](https://github.com/X1011/git-directory-deploy), dec 2015
- [How To Use Any Jekyll Plugins on GitHub Pages with CircleCI](http://tongueroo.com/articles/how-to-use-any-jekyll-plugins-on-github-pages-with-circleci/), aout 2015
- [Jekyll on Github Pages with Plugins](http://sarahcassady.com/2015/07/17/jekyll-on-github-pages/), juill 2015
- [A simple way to use jekyll plugins on GitHub Pages](https://shitao.github.io/use-jekyll-plugin-on-gitpage/), juill 2015
- [How I moved my websites to Dropbox and GitHub](http://alexcican.com/post/guide-hosting-website-dropbox-github/)
- [Jekyll Plugins on GitHub](https://www.sitepoint.com/jekyll-plugins-github/), 2014
- [How to use Jekyll, Plugins and Sass on GitHub Pages](https://gist.github.com/WouterJ/4945964), 2013

#### Other host

- [5apps.com](https://5apps.com/deploy/home) : free for open source
- [Netlify](https://www.netlify.com/) : free for proto & experiment, pro plan free for open source
- [codeship](https://codeship.com) : *"A hosted Continuous Integration service that fits your needs"*.
- [alwaysdata](https://www.alwaysdata.com/fr/) (utilisé par Schapira)

## CMS

- [Prose.io](http://prose.io/)
- [Netlify CMS](https://github.com/netlify/netlify-cms), open source
- [Cloud Cannon](http://cloudcannon.com/), a minima 25$/mois
- [Siteleaf](https://www.siteleaf.com/), with basic free plan
- [DatoCMS](www.datocms.com), really basic free plan
- [Forestry.io](https://forestry.io/), really basic free plan

## Flat File CMS

- [kirby](https://getkirby.com/) : env 20 €
- [statamic](https://statamic.com/) : 200$ !

## Headless / serverless CMS

Stockage des données en cloud, cms pour éditer, accès aux données via API.

- [Contentful](https://www.contentful.com/)
- [Prismic.io](https://prismic.io)
- [GatherContent](https://gathercontent.com)
- [Cockpit](https://getcockpit.com/) : open source version of the above solutions ?

## Plugins et services

- [Staticman](https://staticman.net/) : système de commentaires statiques

> Want comments on your website? Add Disqus, Isso or Facebook comments. Want social integration? Add Twitter or Facebook’s JavaScript widget to your website. Want real-time data updating live on your website? Add a squirt of Firebase. Want search? Add Swiftype. Want to add live chat support? Olark is there. Heck, you can even add an entire store to a static website with Snipcart.

[Why Static Website Generators Are The Next Big Thing](https://www.smashingmagazine.com/2015/11/modern-static-website-generators-next-big-thing/)

- [Fork n go](http://jlord.us/forkngo/) : exemples (avec repo forkable) de sites statiques intéragissant avec des services tiers (google spreadsheet, mapbox, [sheetsee.js](http://jlord.us/sheetsee.js/), iftt...)

## Templates

- [andrew banchich](https://github.com/andrewbanchich?tab=repositories) : portage jekyll de themes [html5up](https://html5up.net/)
	- [gems](https://rubygems.org/profiles/andrewbanchich)
	- [github repo](https://github.com/andrewbanchich?tab=repositories)
- [writer theme](http://preview.themeforest.net/item/writer-a-minimal-blog-for-jekyll/full_screen_preview/10562560) (Theme Forest)
- MadeMistakes : fait ses propres thèmes.
	- [Repos github](https://github.com/mmistakes?tab=repositories)
- [jekyll tips, templates](http://jekyll.tips/templates/)
- [liste templates cloudcannon](http://cloudcannon.com/announcements/2016/12/05/free-jekyll-templates/)

## Divers

*Toujours avoir une rubrique où mettre ce qu'on sait pas où mettre*

- get all tags : https://talk.jekyllrb.com/t/get-all-tags-uniques-in-multiple-collection-pages-without-a-plugin/1221/3
- faciliter post, publish, etc : https://github.com/jekyll/jekyll-compose
