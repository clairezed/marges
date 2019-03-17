---
layout: post
title: "Héberger un site jekyll sur gitlab pages"
category: sustainable_code
tags: [jamstack, jekyll]
---

Actuellement, je teste pas mal de choses à base de github ou gitlab, de webhooks, de services tiers, pour consolider mes pratiques des sites statiques et de la [JAMstack](https://jamstatic.fr/2019/02/07/c-est-quoi-la-jamstack/). Au milieu de ces expérimentations, un client engagé m'a dernièrement amenée à réfléchir à comment être le plus autonome, autosuffisant et "responsable" que possible.

Un cas concret parfait ! Première étape : se débarrasser d'autant d'intermédiaires que possible. Petit tuto technique sans prétention.

<!--more-->


Avertissement : l'article qui suit est plutôt destiné à un lectorat un brin technicien, coutumier ou curieux de git, gitlab, des générateurs de sites statiques et notamment jekyll, des CMS headless, de la gestion de nom de domaines et de certificats SSL...

Mais, en vérité, la première personne à laquelle il s'adresse est d'abord moi-même, pour avancer dans mes raisonnements en les posant à l'écrit et garder trace des ressources mobilisées, si je devais reproduire ce type de configuration. Ici, donc, pas de technicité de haute voltige, mais un pas à pas qui s'adresse plutôt à des débutants.


## Les contraintes

Le client : un collectif d'entreprises engagées dans la transition écologique. Pour des raisons de cohérence évidentes, il souhaite avoir un site écologique et responsable (pas de GAFAM, hébergement autant que possible en France, pas de pub ou de tracking...). C'est d'ailleurs pour ça qu'il a fait appel à mon agence, [l'assembleuse](https://www.lassembleuse.fr/).


A ce jour, ma méthodologie de travail s'appuie sur des services tiers en lesquels j'ai décidé de placer ma confiance, ou bien pour lesquels je n'ai pas trouvé d'alternative satisfaisante :
- code hébergé sur **github** -> passé entre les mains de Microsoft, ce qui refroidit ce client.
- site hébergé sur **[netlify](https://www.netlify.com/)**, qui facilite énormément la gestion de sites statiques -> une entreprise qui a plutôt ma confiance, mais dont les outils restent largement propriétaires et dont le modèle économique peut évoluer du jour au lendemain.
- CMS proposé par **[forestry](https://forestry.io/)** -> même topo que pour netlify, en gros ;
- et en plus, tous ces services sont ricains (NSA mon amour).


Quelles sont les contraintes que j'ai décidé d'intégrer :
- fournir à mon client une **qualité de service professionnel non dégradée**, même si je n'ai pas recourt à mon outillage confortable habituel.
- ne pas faire une croix pour autant sur un **déploiement aussi simple et automatisé que possible** (objectif : déploiement automatique du site d'un simple `git push`)
- **ne pas avoir d'outil à héberger moi-même**, car je n'ai pas les épaules ni l'envie d'assurer l'administration de tout un barda technique critique (donc, pas de gitlab ou de CMS open source hébergé par mes propres moyens).


Je n'ai, pour le moment, pas la solution pour réduire l'intégralité des dépendances à mes services habituels : 
- **Tous les CMS pour sites statiques que je connaisse nécessitent de s'appuyer sur github, gitlab ou bitbucket.** Impossible de se baser sur un gestionnaire autre (un gitlab à soi ou framagit, par exemple). Pour héberger son code ailleurs, il faudra que le client passe un cap dans sa propre autonomie : se passer d'un CMS et gérer lui-même ses contenus, en markdown, depuis le service de gestion de version qu'il aura choisi.
- A défaut, on peut au moins **utiliser gitlab plutôt que github**. Ce qui est un pis aller, puisqu'[aux dernières nouvelles]([https://gitlab.com/gitlab-com/support-forum/issues/82](https://www.developpez.com/actu/208202/A-tous-ceux-qui-ont-fui-GitHub-suite-au-rachat-par-Microsoft-GitLab-est-heberge-sur-Microsoft-Azure/)), gitlab héberge ses outils sur Microsoft Azur, et est en train de passer à Google Cloud. Pas 100% satisfaisant, mais malgré tout nous partons sur cette solution.
- Par contre, son site ne recourt à aucun formulaire. C'est l'une des fonctionnalités pour lesquelles je n'ai pas trouvé d'alternative aussi convaincante que les formulaires netlify. Sans besoin de formulaire, il devient dès lors facilement envisageable de **se passer de netlify**.

Commençons donc déjà par supprimer netlify, qui me fournissait hébergement et connexion sécurisée. L'option qui me semble la + simple pour commencer est de me servir de gitlab pages comme espace d'hébergement et de me fader les configurations du nom de domaine et du certificat SSL.


## Etapes

### Déployer le site sur gitlab pages

#### Rédiger le fichier gitlab-ci.yml

La mise en ligne d'un site sur gitlab demande un poil plus de manipulation que sur github. Il faut en passer par la rédaction d'un fichier `gitlab-ci.yml` qui permet de gérer l'intégration et le déploiement continus sur la plateforme. Il y a donc un peu plus de boulot de configuration, mais ça permet aussi, une fois qu'on est à l'aise avec ce fichier, une granularité + fine de cette configuration.

Et qu'est-ce qu'on y met, dans son fichier `gitlab-ci.yml` ? Cette [liste d'exemples de projets][liste gitlab pages] tournant sur gitlab pages est une très bonne ressource pour dégoter un fichier type pour faire tourner votre projet.

De mon côté, voici à quoi il ressemble : 

```yml
image: ruby:2.4

variables:
  JEKYLL_ENV: production
  LC_ALL: C.UTF-8

before_script:
  - bundle install

test:
  stage: test
  script:
    - bundle exec jekyll build -d test
  artifacts:
    paths:
      - test

pages:
  stage: deploy
  script:
    - bundle exec jekyll build -d public
  artifacts:
    paths:
      - public
  only:
    - master
```

Cette configuration me permet, en testant systématiquement `master`, d'être par exemple informée lorsque l'interaction de mon client et du CMS (qui pousse sur la branche `master`) casse pour je ne sais quelle raison la génération du site (je parle d'expérience...).

#### Adapter les urls de son site web

Dans mon cas, l'url de gitlab pages étant de la forme `https://nom-utilisateur-ou-groupe.gitlab.io/nom-projet`, bien penser à modifier son fichier jekyll `_config.yml` comme suit : 

```yaml
baseurl: "/nom-projet"
url: "https://nom-utilisateur-ou-groupe.gitlab.io"
```

Et voilà ! Votre site devrait être en ligne sur [https://nom-utilisateur-ou-groupe.gitlab.io/nom-projet](https://nom-utilisateur-ou-groupe.gitlab.io/nom-projet) !


### Le connecter au nom de domaine personnalisé

#### Créer l'enregistrement chez notre fournisseur de nom de domaine

J'utilise un sous-domaine pour pointer vers la page d'un projet gitlab. Je créé donc l'enregistrement suivant :

```
sous-domaine	CNAME	10800	nom-utilisateur-ou-groupe.gitlab.io.
```

**Attention** : 
- je mets bien uniquement l'url du domaine générique gitlab (`nom-utilisateur-ou-groupe.gitlab.io`), sans ajouter celle du projet (`/nom-projet`), 
- je n'oublie pas de glisser un `.` après `nom-utilisateur-ou-groupe.gitlab.io` (même si à un moment dans la doc ils disent de ne pas le faire. C'est ce qui a marché pour moi, avec mon hébergement chez Gandi, en tout cas).

Puis je retourne à la page de paramétrage de mon projet sur gitlab (`Settings` > `Pages`)

On se chargera de la connexion sécurisée par la suite, donc pour le moment je décoche la case "Force domains with SSL certificates to use HTTPS".

Je clique sur le bouton "New domain", et saisi mon domaine (`sous-domaine.domaine.fr`) sans me préoccuper pour le moment des champs "Certificate" ou "Key".

Il me faut maintenant authentifier la propriété de ce domaine avec un nouvel enregistrement DNS, comme indiqué une fois qu'on a enregistré son domaine dans les paramètres.

#### Authentifier son domaine avec un enregistrement TXT

Retour chez mon fournisseur de nom de domaine pour saisir l'enregistrement TXT qui vient de m'être donné : 

```
_gitlab-pages-verification-code.mon-sous-domaine	TXT	1800	"gitlab-pages-verification-code=code0bscur"
```

Après un court instant, de retour dans la page de paramètres de mon projet gitlab, mon nom de domaine apparaît bien comme vérifié. Félicitation moi-même !

#### Mettre à jour l'url du site

Bis repetita, reste à mettre à jour mon fichier jekyll `_config.yml` comme suit : 

```yaml
# baseurl: "/nom-projet"
url: "http://sous-domaine.domaine.fr"
```

### Connexion https

Une étrange opération vaudou a eu raison de cette étape.

En vérité, au sortir de l'étape précédente, il m'était impossible d'accéder à mon site sur sa nouvelle url (`sous-domaine.domaine.fr`). Après plusieurs essais infructueux et relecture de la doc, je décidais de partir me balader et de jeter un oeil neuf sur le problème à mon retour.

Sauf qu'à mon retour, non seulement le lien fonctionnait, mais en plus un certificat SSL Let's Encrypt était paramétré pour mon nom de domaine, sans que je n'aie rien fait o_O ...

Une histoire de temps de prise en compte des changements de nom de domaine, couplé à une fonctionnalité non documentée de gitlab ? 

Aucune idée, mais comme ça "juste marche", j'avoue que je n'ai pas creusé plus loin. Hâte de voir dans 3 mois comment se déroule le renouvellement automatique du certificat. 


### L'étape d'après

J'avais déjà remarqué il y a 1 ou 2 ans que les gitlab pages géraient bizarrement les sites jekyll et obligeaient parfois à des adaptations un peu mystiques. Même si j'ai l'impression que des améliorations ont été faites depuis, il reste encore quelques insuffisances.

Ainsi, tout ce que j'explique ci-dessus est valable et fonctionne pour un site jekyll standard, dès lors qu'on complexifie ou personnalise son site, on risque de se confronter à des comportements étranges de gitlab pages, notamment dans la gestion des urls.

Ainsi en est-il du site de ce client. J'ai organisé les pages en dossiers et, pour certaines, sous-dossiers, puis automatisé le paramétrage des pages de sous-dossiers à l'aide de `defaults` dans mon fichier `_config.yml`. Dès lors que mes pages n'ont pas de sous-pages (pas de sous-dossier ou sous_dossier vide), les liens sont parfaitement gérés. Dans le cas contraire, gitlab pages me gratifie d'une 404.

Peut-être est-ce en lien avec la façon dont gitlab [résoud les urls ambigües](https://docs.gitlab.com/ee/user/project/pages/introduction.html#resolving-ambiguous-urls) ? Peut-être, mais au fond peu m'importe. Le simple fait qu'il n'y ait pas d'équivalence entre le comportement de mon site en local, sur mon ordinateur de développement, et sur gitlab pages, est une vraie douleur dans les fesses. Je n'ai pas envie de faire un surcroît d'efforts pour me conformer au particularisme de gitlab pages, d'autant plus que cette solution d'hébergement ne me convainc pas à 100%.

J'ai donc envie de pousser la logique un peu plus loin et d'héberger le site ailleurs que sur gitlab pages. Ce sera l'objet d'un prochain article.

### Ressources

- [Liste de projets gitlab-pages pour trouver des exemples de fichiers gitlab-ci.yml][liste gitlab pages]
- [Page d'entrée de la documentation des gitlab pages][doc generale]
- [Page de documentation custom domain et SSL][doc domain ssl]
- [Page de documentation let's encrypt pour gitlab pages](https://docs.gitlab.com/ee/user/project/pages/lets_encrypt_for_gitlab_pages.html)


[liste gitlab pages]: https://gitlab.com/pages
[doc generale]: https://docs.gitlab.com/ee/user/project/pages/
[doc domain ssl]: https://docs.gitlab.com/ee/user/project/pages/getting_started_part_three.html


> Une question ? Une précision ? Un élément auquel je n'ai pas pensé ? N'hésitez pas à me tirer par la manche sur [twitter](https://twitter.com/ZooletteDesBois) ou [mastodon](https://octodon.social/@clairezed) !