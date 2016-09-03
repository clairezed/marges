---
layout: page
title: Cartographier par en bas
permalink: cartographie-du-bas
tags: [faire a plusieurs, carte]
category: binary_transition
---

Depuis mon arrivée dans ma nouvelle ville, je suis fascinée par le nombre de commerces vacants, laissés pour certains à l'abandon depuis ce qui semble etre des années. Ca fait longtemps que je garde une oreille intéressée pour tout ce qui est de l'ordre de la réappropriation par les quidams de toute sorte de chose, et notamment des espaces urbains, et là, voir tous ces potentiels inexploités, ça me fait bouillir.

Alors, peut etre est-ce dans l'air du temps, peut etre suis-je tout simplement + attentive actuellement à ce type de projets... Toujours est-il que je tombe beaucoup en ce moment sur des projets de cartographie d'espaces vacants, de répertoires de lieux à transformer, de processus de récupération d'endroits inexploités.

Il est temps de commencer un recueil. L'étude préliminaire avant de commencer (bient^ot ?) un projet ici.

## Ressources générales

### TransforMap

Je suis pas sure de comprendre parfaitement de quoi il s'agit.
TransforMap works towards an online platform to visualize the myriad of alternatives to the dominant economic thinking on a single mapping system. It will give everyone the opportunity to map the initiatives, communities, projects, worker-owned, self-managed, democratically organised companies and other institutions dedicated to meeting people's needs, serving the common good and/ or contributing to a sustainable way of life.

Ca parle d'outils, de taxonomie, d'api communs, mais je n'en trouve pas de traces véritablement formalisées.

http://transformap.co/
https://wiki.transformaps.net/wiki/Main_Page

### Annuaires

- http://www.reconomy.org/30-maps-to-help-local-change-makers-and-community-organisers/

## Projets existants

### Lande

Montréal.
Depuis 2014.

Objet : Lande facilite la réappropriation permanente ou temporaire des terrains vacants montréalais par les résidents.

#### Qui

Professionnels en droit, en urbanisme, en gestion de projets communautaires, en communication, en design et en agriculture urbaine.

#### Productions

###### Application web (2015)

Plateforme web permettant aux habitants de répertorier les terrains vacants ainsi que d'amorcer des projets de réappropriation

Commentaires :
- site en wordpress (ce qui me semble pas des plus adaptés)
- pas d'application smartphone, version responsive vite fait (utilisation de bootstrap)
- pas réussi à capter comment on contribue à la revalorisation (bug ?)
- utilisation de google maps, ce qui me parait un poil contradictoire
- pas l'impression que le code soit open source (idem que remarque précédente)

[landemtl.com](http://www.landemtl.com/)

###### Recherche (2016)

Volonté de créer des connaissances sur les terrains vacants montréalais. Cette première recherche porte sur le thème de la **gouvernance**.

[Réglementation sur les terrains publics vacants à Montréal](https://www.docdroid.net/JX3RdkI/rglementation-sur-les-terrains-publics-vacants-montral-lande-2016.pdf.html), Etat des lieux et comparaisaons avec d'autres villes en Amérique du Nord (avril 2016)


### 596 acres

#### Productions

###### Application web (2011)

1ere version développée pour Brooklyn (NY), qui a ensuite fait des petits aux USA. Aujourd'hui, il existe une brique de base, open source, réutilisable par qui le souhaite.

Commentaires
- la doc du projet github est une très bonne source d'info, tant technique qu'opérationnelle.

https://github.com/596acres/django-livinglots



### Esquisse de cahier des charges

Etape par étape, brique par brique

#### Cartographie de base

Carte qui répertorie aussi bien les terrains que les locaux ou immeubles vacants
Dans l'idéal, on a :
1. adresse du terrain / local
2. photo du terrain / local
3. délimitation de la forme du terrain / local

#### Cartographie informative

- surface / superficie
- à qui il appartient
- quel statut légal : bail commercial, en vente
- quelle actualité : projet immobilier à tel échéance, innocupé depuis...
- prix éventuel
- contact

#### Cartographie comme outil de réappropriation

- module qui permet sur chaque parcelle d'etre mis en contact avec d'autres personnes qui veulent y faire qqch
- outil développé en open source, ce qui est giga cool
- outil développé en python (Django), ce qui est carrément moins cool pour moi

#### Besoins techniques

- pour les formes : GIS (cf [QGIS](http://qgis.org/) version open source)

