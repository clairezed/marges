---
title: Cartographier par en bas
date: '2016-12-04 00:00:00'
layout: page
permalink: cartographie-du-bas
tags:
- faire a plusieurs
- carte
categories:
- binary_transition
---

Depuis mon arrivée dans ma nouvelle ville, je suis fascinée par le nombre de commerces vacants, laissés pour certains à l'abandon depuis ce qui semble etre des années. Ca fait longtemps que je garde une oreille intéressée pour tout ce qui est de l'ordre de la réappropriation par les quidams de toute sorte de chose, et notamment des espaces urbains, et là, voir tous ces potentiels inexploités, ça me fait bouillir.

<!--more-->


<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Ressources générales](#ressources-gnrales)
	- [TransforMap](#transformap)
	- [Articles, présentations](#articles-prsentations)
	- [Tech](#tech)
		- [Formats](#formats)
		- [Javascript API](#javascript-api)
		- [Ingrédients](#ingrdients)
- [Projets existants](#projets-existants)
	- [Lande](#lande)
		- [Qui](#qui)
		- [Application web (2015)](#application-web-2015)
		- [Recherche (2016)](#recherche-2016)
	- [596 acres](#596-acres)
		- [Application web (2011)](#application-web-2011)
	- [Cartographies ESS, etc](#cartographies-ess-etc)
- [Projet : carte de l'innovation sociale et numérique Grand Est](#projet-carte-de-linnovation-sociale-et-numrique-grand-est)
	- [Exemples](#exemples)
- [Projet : cartographie des espaces vacants](#projet-cartographie-des-espaces-vacants)
	- [Cartographie de base](#cartographie-de-base)
	- [Cartographie informative](#cartographie-informative)
	- [Cartographie comme outil de réappropriation](#cartographie-comme-outil-de-rappropriation)
	- [Besoins techniques](#besoins-techniques)

<!-- /TOC -->


Alors, peut etre est-ce dans l'air du temps, peut etre suis-je tout simplement + attentive actuellement à ce type de projets... Toujours est-il que je tombe beaucoup en ce moment sur des projets de cartographie d'espaces vacants, de répertoires de lieux à transformer, de processus de récupération d'endroits inexploités.

Il est temps de commencer un recueil. L'étude préliminaire avant de commencer (bientôt ?) un projet ici.

## Ressources générales

### TransforMap

Je suis pas sure de comprendre parfaitement de quoi il s'agit.
TransforMap works towards an online platform to visualize the myriad of alternatives to the dominant economic thinking on a single mapping system. It will give everyone the opportunity to map the initiatives, communities, projects, worker-owned, self-managed, democratically organised companies and other institutions dedicated to meeting people's needs, serving the common good and/ or contributing to a sustainable way of life.

Ca parle d'outils, de taxonomie, d'api communs, mais je n'en trouve pas de traces véritablement formalisées.

http://transformap.co/
https://wiki.transformaps.net/wiki/Main_Page


### Articles, présentations

- http://www.reconomy.org/30-maps-to-help-local-change-makers-and-community-organisers/
- [L'épopée d'un développeur front au pays des cartes](https://www.paris-web.fr/2016/conferences/l-epopee-d-un-developpeur-front-au-pays-des-cartes.php) ([diaporama](https://docs.google.com/presentation/d/1SCyIQAczqyZCQWKS-K8nTVMnVJP6_DLHK3QG9t7ToXc/edit#slide=id.g1132b3dbc3_0_0))
- http://www.fantasticmaps.com/
- [Geofabrik Tools - Map Compare](http://tools.geofabrik.de/)

### Tech

#### Formats

- geoJSON
- KML

#### Javascript API

- customisation graphique des gmaps : https://snazzymaps.com
- leaflet
- mapbox
- [Mapzen](https://mapzen.com/)
- CartoDB  (PostgreSQL + PostGIS + CARTO + CartoCSS)

#### Ingrédients

**Basemap**

Réutiliser :
- tuiles OSM
- CARTO (positron)
- Stamen (toner...)
- Mapbox (streets...)
- Google Maps

Créer:
- TileMill
- Mapbox Studio
- Mapzen Tangram

## Projets existants

### Lande

Montréal.
Depuis 2014.
[landemtl.com](http://www.landemtl.com/)

Objet : Lande facilite la réappropriation permanente ou temporaire des terrains vacants montréalais par les résidents.

#### Qui

Professionnels en droit, en urbanisme, en gestion de projets communautaires, en communication, en design et en agriculture urbaine.

#### Application web (2015)

Plateforme web permettant aux habitants de répertorier les terrains vacants ainsi que d'amorcer des projets de réappropriation

Commentaires :
- site en wordpress (ce qui me semble pas des plus adaptés)
- pas d'application smartphone, version responsive vite fait (utilisation de bootstrap)
- pas réussi à capter comment on contribue à la revalorisation (bug ?)
- utilisation de google maps, ce qui me parait un poil contradictoire
- pas l'impression que le code soit open source (idem que remarque précédente)


#### Recherche (2016)

Volonté de créer des connaissances sur les terrains vacants montréalais. Cette première recherche porte sur le thème de la **gouvernance**.

[Réglementation sur les terrains publics vacants à Montréal](https://www.docdroid.net/JX3RdkI/rglementation-sur-les-terrains-publics-vacants-montral-lande-2016.pdf.html), Etat des lieux et comparaisaons avec d'autres villes en Amérique du Nord (avril 2016)


### 596 acres

https://github.com/596acres/django-livinglots

#### Application web (2011)

1ere version développée pour Brooklyn (NY), qui a ensuite fait des petits aux USA. Aujourd'hui, il existe une brique de base, open source, réutilisable par qui le souhaite.

Commentaires
- la doc du projet github est une très bonne source d'info, tant technique qu'opérationnelle.


### Ushahidi

Cartographie collaborative

https://www.ushahidi.com/


### Cartographies ESS, etc

- http://www.apur.org/dataviz/ess/index.html
- - [Plateforme Utopies Concrètes](http://utopies-concretes.org/#/fr/map)


## Projet : carte de l'innovation sociale et numérique Grand Est

### Exemples

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

- module qui permet sur chaque parcelle d'etre mis en contact avec d'autres personnes qui veulent y faire qqch
- outil développé en open source, ce qui est giga cool
- outil développé en python (Django), ce qui est carrément moins cool pour moi

### Besoins techniques

- pour les formes : GIS (cf [QGIS](http://qgis.org/) version open source)
