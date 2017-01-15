---
layout: post
title: "Radiographie d'un site 2 - Public Sector Map"
category: sustainable_code
tags: [radiographie, toolkit]

---

Voici la deuxième étude de site à travers son code source ! Je m'attelle aujourd'hui à un annuaire des designers de politiques publiques dans le monde, que je trouve vraiment clair, fonctionnel et engageant.

<!--more-->

*Pour en savoir un peu plus sur cette histoire de radiographie, d'étude de site, parcourez l'intro de la [première radiographie]({{ site.baseurl }}{% link _posts/2016-08-08-radiographie-01.md %}).*

## Radiographie n°2 - Design des politiques publiques

Le site en question : [Design des politiques publiques][source], produit par [Nesta](http://www.nesta.org.uk/) et la [27e région](http://www.la27eregion.fr/)

### Framework

Vu comme le design m'apparaît comme spécifique et adapté au projet, j'ai pensé à un site fait main, non basé sur un CMS. Que nenni !
Le site s'appuie sur un WordPress (4.7.1), avec un thème a priori fait maison. C'est rare que je tombe sur des thèmes custom, ça fait plaisir à voir !

### En front

J'ai l'impression que pour l'orchestration du front, le thème est basé sur [Sage](https://roots.io/sage/), *"The best WordPress starter theme with a modern front-end development workflow."*


En terme de librairie et fonctionnalités pour ce thème, on peut compter sur :

**Des classiques :**
- [Bootstrap v4](https://v4-alpha.getbootstrap.com/)
- [Font Awesome](http://fontawesome.io/)
- [Tiny MCE](https://www.tinymce.com/) pour le wysiwyg

**La partie carte :**
- [mapbox.js](https://www.mapbox.com/mapbox.js) : Mapbox JavaScript API, a Leaflet Plugin

**Les acteurs en détail :**
- [MixItUp v2.1.11](https://www.kunkalabs.com/page/mixitup/) : *"A high-performance, dependency-free library for animated filtering, sorting, insertion, removal and more"*.  ([repo github](https://github.com/patrickkunka/mixitup/))

**Les acteurs par date :**
Pas de librairie particulière détectée ici, ça me donne l'impression que c'est fait à la mano.


**En vrac :**
- [Colorbox 1.6.4](http://www.jacklmoore.com/colorbox/) : lightbox plugin
- [ScrollMagic v2.0.5](http://scrollmagic.io/)
- [Sticky Plugin v1.0.3](http://stickyjs.com/)


### Auteur

Pas de crédit précis, je me demande si [Nesta](http://www.nesta.org.uk/blog/design-public-sector-interactive-map), l'une des deux structures à l'origine du projet, n'aurait pas les moyens en interne de produire ce type d'outil.

Source : Cartographie [Design des politiques publiques][source]

[source]: http://publicsector-map.designforeurope.eu/fr/#
