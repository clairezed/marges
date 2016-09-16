---
layout: post
title: "Etat des lieux des utils pour applications hors ligne"
category: binary_transition
tags: [civic tech]

---

J'entends de plus en plus parler actuellement de [Progressive Web Apps](https://developers.google.com/web/progressive-web-apps/). Ce type d'application, conçu avec les outils web, m'intéresse notamment en ce qu'elles permettent de servir au mieux des utilisateurs ayant des terminaux pourris ou des conditions de connection naze. Un type de personnes que je n'ai pas envie de négliger, histoire de ne pas ajouter de la discrimination à leur handicap matériel.

<!--more-->

Prise de note rapide ici des outils dont j'entends parler sur les progressive web apps, pour quand je prendrai le temps de m'y pencher.

> For URL addressable resources, use the [Cache API](https://davidwalsh.name/cache) (part of Service Worker). For all other data, use [IndexedDB](https://docs.webplatform.org/wiki/apis/indexeddb) (with a Promises wrapper).


Parmi les librairies IndexedDb : [PouchDb](https://pouchdb.com/), qui permet de la synchronisation (entendu parlé en bossant sur des projets Meteor). Plein d'autres lib', et leurs spécificités, citées.

Bonne comparaison avec les moyens de stockage coté client + classiques (web storage, cookies...)


Ressources en vrac :



Source : [Offline Storage for Progressive Web Apps][source]

https://www.quaternum.net/2016/06/23/quatre-bonnes-raisons-de-faire-du-web-hors-connexion/

[source]: https://medium.com/dev-channel/offline-storage-for-progressive-web-apps-70d52695513c#.wnfv7c6py
