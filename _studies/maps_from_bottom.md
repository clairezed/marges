---
title: Cartographier par en bas
date: '2016-12-04 00:00:00'
layout: page
permalink: cartographie-du-bas
tags: [faire a plusieurs, carte]
category: binary_transition
---

Depuis mon arrivée dans ma nouvelle ville, je suis fascinée par le nombre de commerces vacants, laissés pour certains à l'abandon depuis ce qui semble être des années. Ca fait longtemps que je garde une oreille intéressée pour tout ce qui est de l'ordre de la réappropriation par les quidams de toute sorte de chose, et notamment des espaces urbains, et là, voir tous ces potentiels inexploités, ça me fait bouillir.

<!--more-->

Alors, peut être est-ce dans l'air du temps, peut être suis-je tout simplement + attentive actuellement à ce type de projets... Toujours est-il que je tombe beaucoup en ce moment sur des projets de cartographie d'espaces vacants, de répertoires de lieux à transformer, de processus de récupération d'endroits inexploités.


Il est temps de commencer un recueil, étude préliminaire avant de commencer (bientôt ?) un projet.



<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Ressources générales](#ressources-gnrales)
	- [TransforMap](#transformap)
	- [Articles, présentations](#articles-prsentations)
- [Tech](#tech)
	- [Collecte des données](#collecte-des-donnes)
	- [Réalisation de cartes](#ralisation-de-cartes)
	- [Fonds de carte, basemap](#fonds-de-carte-basemap)
		- [Réexploiter des styles existants](#rexploiter-des-styles-existants)
		- [Créer des styles custom](#crer-des-styles-custom)
- [Projets existants](#projets-existants)
	- [Lande](#lande)
	- [596 acres](#596-acres)
	- [Ushahidi](#ushahidi)
- [Exemples de cartographies d'acteurs locaux](#exemples-de-cartographies-dacteurs-locaux)
- [Projet : cartographie des espaces vacants](#projet-cartographie-des-espaces-vacants)
	- [Cartographie de base](#cartographie-de-base)
	- [Cartographie informative](#cartographie-informative)
	- [Cartographie comme outil de réappropriation](#cartographie-comme-outil-de-rappropriation)
	- [Besoins techniques](#besoins-techniques)

<!-- /TOC -->

## Ressources générales

### TransforMap

Je suis pas sure de comprendre parfaitement de quoi il s'agit.
TransforMap works towards an online platform to visualize the myriad of alternatives to the dominant economic thinking on a single mapping system. It will give everyone the opportunity to map the initiatives, communities, projects, worker-owned, self-managed, democratically organised companies and other institutions dedicated to meeting people's needs, serving the common good and/ or contributing to a sustainable way of life.

Ca parle d'outils, de taxonomie, d'api communs, mais je n'en trouve pas de traces véritablement formalisées.

[Site web transformap](http://transformap.co/)
[wiki transformap](https://wiki.transformaps.net/wiki/Main_Page)


### Articles, présentations

- [30 maps to help local change-makers and community organisers](http://www.reconomy.org/30-maps-to-help-local-change-makers-and-community-organisers/) (2013)
- [L'épopée d'un développeur front au pays des cartes](https://www.paris-web.fr/2016/conferences/l-epopee-d-un-developpeur-front-au-pays-des-cartes.php) ([diaporama](https://docs.google.com/presentation/d/1SCyIQAczqyZCQWKS-K8nTVMnVJP6_DLHK3QG9t7ToXc/edit#slide=id.g1132b3dbc3_0_0))
- [Fantasticmaps](http://www.fantasticmaps.com/) : Fantasy maps and mapmaking tutorials by Jonathan Roberts
- [Geofabrik Tools - Map Compare](http://tools.geofabrik.de/)
- [Le jour où j'ai fait les poubelles](http://florian.lainez.fr/le-jour-ou-jai-fait-les-poubelles/) : récit d'une collecte et traitement de données sur open street map

## Tech

### Collecte des données

- [Mapotempo](https://www.mapotempo.com/) : Logiciels de planification et d’optimisation de tournées
- [Mapillary](https://www.mapillary.com/) : Street-Level Photos for Everyone -> positionnement de photo sur une carte à la street view


### Réalisation de cartes

- [Leaflet](http://leafletjs.com/)
- [Mapbox](https://www.mapbox.com/)
- [Mapzen](https://mapzen.com/)
- [carto.com](https://carto.com/) : (anciennement CartoDB : PostgreSQL + PostGIS + CARTO + CartoCSS)
- [map contrib](https://www.cartes.xyz/) : Thematic OpenStreetMap contribution
- [SnazzyMaps](https://snazzymaps.com) : customisation graphique des google maps
- [mapinseconds](http://mapinseconds.com/)

### Fonds de carte, basemap

#### Réexploiter des styles existants
- tuiles OSM
- [Stamen](http://maps.stamen.com/)
- Mapbox (streets...)

#### Créer des styles custom
- [TileMill](https://tilemill-project.github.io/tilemill/)
- [Mapbox Studio](https://www.mapbox.com/mapbox-studio/)
- [Mapzen Tangram](https://mapzen.com/products/tangram/)

## Projets existants

### Lande
[landemtl.com](http://www.landemtl.com/)

Montréal, depuis 2014.

Projet mené par rofessionnels en droit, en urbanisme, en gestion de projets communautaires, en communication, en design et en agriculture urbaine.


**Objet** : Lande facilite la réappropriation permanente ou temporaire des terrains vacants montréalais par les résidents.


**Application web (2015)** : Plateforme web permettant aux habitants de répertorier les terrains vacants ainsi que d'amorcer des projets de réappropriation

Remarques personnelles :
- site en wordpress (ce qui me semble pas des plus adaptés)
- pas d'application smartphone, version responsive vite fait (utilisation de bootstrap)
- pas réussi à capter comment on contribue à la revalorisation (bug ?)
- utilisation de google maps, ce qui me parait un poil contradictoire
- pas l'impression que le code soit open source (idem que remarque précédente)


**Recherche (2016)** : Volonté de créer des connaissances sur les terrains vacants montréalais. Cette première recherche porte sur le thème de la **gouvernance**.

[Réglementation sur les terrains publics vacants à Montréal](https://www.docdroid.net/JX3RdkI/rglementation-sur-les-terrains-publics-vacants-montral-lande-2016.pdf.html) : Etat des lieux et comparaisons avec d'autres villes en Amérique du Nord (avril 2016)


### 596 acres

[Repo github](https://github.com/596acres/django-livinglots)

**Application web (2011)** : 1ere version développée pour Brooklyn (NY), qui a ensuite fait des petits aux USA. Aujourd'hui, il existe une brique de base, open source, réutilisable par qui le souhaite.

Remarques personnelles :
- la doc du projet github est une très bonne source d'info, tant technique qu'opérationnelle.


### Ushahidi

Cartographie collaborative

[ushahidi.com](https://www.ushahidi.com/)


## Exemples de cartographies d'acteurs locaux

- [Carte des acteurs des économies solidaires et innovantes](http://www.apur.org/dataviz/ess/index.html)
- [Plateforme Utopies Concrètes](http://utopies-concretes.org/#/fr/map)
- [Carte des acteurs du numérique Ilde de France - Techonmap](http://data.iledefrance.fr/explore/dataset/tech-on-map/?tab=metas&dataChart=eyJxdWVyaWVzIjpbeyJjb25maWciOnsiZGF0YXNldCI6InRlY2gtb24tbWFwIiwib3B0aW9ucyI6eyJ0YWIiOiJhbmFseXplIn19LCJjaGFydHMiOlt7InR5cGUiOiJsaW5lIiwiZnVuYyI6IkNPVU5UIiwiY29sb3IiOiIjZmYwMDAwIn1dLCJ4QXhpcyI6ImNyZWF0aW9ueWVhciIsIm1heHBvaW50cyI6IiIsInRpbWVzY2FsZSI6InllYXIiLCJzb3J0IjoiIn1dLCJ0aW1lc2NhbGUiOiJ5ZWFyIn0%3D&refine.category=Tiers-lieu&location=9,48.73083,2.38541) : avec tableau données, api, etc
- [TIERS LIEUX (hybride)et ECOCENTRE de FRANCE](https://www.google.com/maps/d/viewer?hl=fr&authuser=0&mid=1Nks47bdhbdvJxfCcYyRgh6pbmko) : google maps...
- [Fab lab Bretagne](http://guillaume-rouan.net/blog/2015/10/10/carte-des-fablab-de-bretagne/) ([repo github](https://github.com/grouan/bzh_fablab)) : osm, leaflet, geoJSON
- [Makery Labs](http://www.makery.info/map-labs/) : osm, mapbox, clustering, g_form pour ajouter un lab
- [TL Afrique](https://umap.openstreetmap.fr/fr/map/tiers-lieux-libres-et-open-source-en-afrique-franc_8286#13/12.3619/-1.5110) : umap

**infos**
- http://movilab.org/index.php?title=Liste_des_Tiers-Lieux


## Projet : cartographie des espaces vacants

### Cartographie de base

Carte qui répertorie aussi bien les terrains que les locaux ou immeubles vacants
Dans l'idéal, on a :
1. adresse du terrain / local
2. photo du terrain / local
3. délimitation de la forme du terrain / local

### Cartographie informative

- surface / superficie
- à qui il appartient
- quel statut légal : bail commercial, en vente
- quelle actualité : projet immobilier à tel échéance, innocupé depuis...
- prix éventuel
- contact

### Cartographie comme outil de réappropriation

- module qui permet sur chaque parcelle d'être mis en contact avec d'autres personnes qui veulent y faire qqch
- outil développé en open source, ce qui est giga cool
- outil développé en python (Django), ce qui est carrément moins cool pour moi

### Besoins techniques

- pour les formes : GIS (cf [QGIS](http://qgis.org/) version open source)
