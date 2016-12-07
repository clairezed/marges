---
layout: post
title: "Principes de lutte contre la surcharge cognitive"
category: binary_transition
tags: [design, ui/ux]

---

Dans [Smashing Magazine](https://www.smashingmagazine.com/), Danny Halarewich revient sur quelques principes qui visent à éviter la surcharge cognitive chez les utilisateurs d'un site. Capital pour concevoir des outils utiles, utilisables et utilisés.

<!--more-->


> The best user experience is the one the user doesn’t notice. 

Ainsi commence l'article, et c'est l'un des points figurant en haut de ma table des lois mentale, quand je réfléchis à la conception d'un site (ce qui ne signifie pas que j'arrive systématiquement à m'y tenir bien évidemment) . 


## Quelques enseignements du livre Don't Make me Think, de Steve Krug

- Chaque page devrait se suffire à elle-même et ne pas nécessiter d'explication, car un utilisateur est susceptible de débarquer sur le site à n'importe quelle page.
- L'utilisabilité d'un système peut être considérée comme bonne quand une personne de capacité ou d'expérience moyenne peut accomplir son objectif.
- La plupart des usages du web sont guidés par la motivation de gagner du temps.
- Le bouton "Retour" est le + utilisé dans les navigateurs.
- Même s'il n'est jamais utilisé, le bouton "accueil" rassure les utilisateurs.

## Les principales causes de surcharge cognitive

### Les actions non nécessaires

*Exemple* : exiger l'inscription d'un utilisateur avant toute utilisation du site.

*Solutions* : 
- Lister toutes les étapes que doit effectuer un utilisateur pour accomplir une tâche, supprimer celles qu'on peut supprimer (regarder les redondances); par exemple un click supplémentaire qui pourrait être évité grâce à l'autofocus sur un champs.

### Sur-stimulation

*Exemple* : des animations simultanées sur une même page

*Solutions* : 
- se débarasser de tout ce qui n'est pas essentiel. (Voir aussi une [étude](https://static.googleusercontent.com/external_content/untrusted_dlcp/research.google.com/en/us/pubs/archive/38315.pdf) démontrant que les utilisateurs préfères les sites simples par rapport à ceux visuellement complexes)
- diversifier le contenu en alternant texte et image
- privilégier les mises en page symétriques ou à l'asymétrie construite

### Trop d'options (Loi d'Hicks)

Plus on a d'options, plus on met de temps à prendre une décision.

*Solutions*

- grouper les options multiples sous des catégories parapluie
- mais attention à ne pas avoir trop de sous menus et navigations cachées, qui limitent la capacité de découverte -> on peut aussi dans ce cas revoir l'architecture globale et réduire le nombre de catégories de façon à ce que toutes les catégories puissent entrer dans la principale barre de navigation.

### Trop de contenu

*Exemple* : afficher tous les produits d'un coup ([www.arngren.net](http://www.arngren.net/))

*Solutions* :

Morceler le contenu ("chunking", en v.o., avec plein d'exemples dans cet [article](https://www.nngroup.com/articles/chunking/)) 

- regroupement d'images dans des "cards", à la Etsy
- formulaires en plusieurs étapes
- découper les longs textes en courts paragraphes avec des titres clairs

### Une interface ambigue

*Exemple* : icône inconnue

*Solutions* 

- Réutiliser comme icône des visuels familiers
- Utiliser des termes connus dans la labellisation de la navigation et des boutons
- En cas de fonctionnalité inédite, se fier à des principes de skeuomorphism pour le rattacher à une expérience connue
- ne pas oublier l'"onboarding" si l'interface recèle des subtilités

### Pages et fonctionnalités difficiles à trouver

Là encore, faire simple et connu, mais malgré ça vous pouvez très bien ne pas avoir la même façon de réfléchir et de vous orienter que l'utilisateur final. 

*Solutions*

Quelques tests à effectuer avec un groupe d'utilisateur type : 
- Test de tri de carte ([card-sorting test](https://www.smashingmagazine.com/2014/10/improving-information-architecture-card-sorting-beginners-guide/))
- Test d'arbre ([tree test](http://www.measuringu.com/blog/tree-testing-ia.php))
- [8 principes de l'architecture d'information](https://www.asis.org/Bulletin/Aug-10/AugSep10_Brown.pdf), parmi lesquels : 
  - classification multiple : utiliser différentes méthodes de classification pour s'adapter aux différentes façon de penser des utilisateurs
  - divulgation : ne révéler que la quantité nécessaire d'info pour que l'utilisateur sache à quoi s'attendre
- se débarrasser des redondances en combinant les pages ou les items de menu (une seule page pour toutes les bios des membres d'une équipe, par exemple)
- si certaines fonctionnalités sont + importantes que d'autres, utiliser des techniques pour les mettre en avant (taille, animation, couleur...)

### Incohérence interne

*Exemple* :  utiliser différente façon d'indiquer un lien (une fois souligné, une fois non) suivant la page

*Solutions*

- mettre en place un "Style Guide"

Source : [Reducing Cognitive Overload For A Better User Experience][source]

[source]: https://www.smashingmagazine.com/2016/09/reducing-cognitive-overload-for-a-better-user-experience/
