---
title: Radiographie d'un site 1 - Moments d'invention 2016
date: '2016-08-08 00:00:00'
layout: post
tags:
- radiographie
- toolkit
categories:
- sustainable_code
---

Quand je tombe sur des sites qui donnent une impression un peu "la classe" tout en paraissant d'un niveau technique atteignable, j'aime bien chercher comment il a été fait. Ca me permet de faire une veille dynamique, en condition réelle, en observant les outils qui sont concrètement utilisés et éprouvés.

<!--more-->

Alors que je retombe ce soir dans mon vice ("Oh le joli site ! hop, ouverture de la console de mon navigateur, hop, trifouille dans le `<head>`...), je me dit que je ferais aussi bien de commencer une série de radiographie de sites.

## Radiographie n°1 - Moments d'invention 2016

Le site en question : [Moments d'invention 2016](http://www.grand-nancy.org/gn/momentsdinvention/intro.php), un événement qui a l'air assez à la rentrée à Nancy.

### Back

Pas grand chose à sortir sur le back. C'est du PHP, mais wappalizer n'arrive pas à m'en dire plus. Framework fait maison ?

### Front

Là, c'est + intéressant. C'est ici surtout que réside l'effet whaou, et j'ai pu repérer deux ou trois trucs.

- Menu principal qui repousse le reste de la page : merci à [codrops](http://tympanus.net/codrops/), fournisseur officel d'effets wahou pour des générations de développeurs ([lien vers la demo du menu](http://tympanus.net/Development/OffCanvasMenuEffects/topexpand.html)),
- Transition en douceur des pages : [smoothState.js](https://github.com/miguel-perez/smoothState.js)
- [animate.css](https://daneden.github.io/animate.css/), un grand classique pour l'animation d'éléments !
- un helper pour gérer facilement les classes css en js : [classie](https://github.com/desandro/classie)

### Auteur

Pas réussi à trouver de crédits sur le site, si vous savez qui en est à l'origine, ça m'intéresse !


Source : [Moment d'invention 2016][source]

[source]: http://www.grand-nancy.org/gn/momentsdinvention/intro.php
