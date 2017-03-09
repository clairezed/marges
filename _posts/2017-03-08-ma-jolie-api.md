---
layout: post
title: Construire une jolie API
category: sustainable_code
tags: [code]

---

Ce n'est pas tous les jours que j'ai à créer des API, mais comme je tombe sur un article vraiment clair et didactique, plein de bons conseils, j'en profite pour prendre des notes.


<!--more-->

On y trouve des conseils "de base", qui parlent de REST, de CRUD... Voici ce que je retiens personnellement, pour ne pas l'avoir encore suffisamment en tête.


## Anticiper l'ajout de données à un flux

La plupart du temps, un flux va être amené à évoluer, on va avoir besoin de données complémentaires, de méta-données... On peut l'anticiper à un coût quasi nul.

Plutôt que d'avoir par exemple pour réponse à une requête `GET` :

```json
{
    "id": 1,
    "name": "Tim Berners-Lee",
    "age": 61
  }, {
    "id": 2,
    "name": "Ada Lovelace",
    "age": 36
  }, {
    "id": 3,
    "name": "Roy Fielding"
  }
```

Prévoir dès le début de renvoyer ces données sous une clé type, `data` par exemple :

```json
{
  "data": [{
    "id": 1,
    "name": "Tim Berners-Lee",
    "age": 61
  }, {
    "id": 2,
    "name": "Ada Lovelace",
    "age": 36
  }]
}
```

Ce qui permet par la suite d'ajouter des infos très simplement :

```json
{
  "url": "https://example.com/user",
  "datetime": "2017-02-27T11:43:37+0500",
  "data": [...],
  "elements": 3
}
```

## Et les requêtes non CRUD ?

Je ne suis pas sûre de suivre les auteurs dans leur design des requêtes autres. Leur exemple en tout cas me parait verbeux et redondant :

```bash
Request: GET /search/findUserByAge?age=61
```

Pourquoi ne pas considérer qu'il s'agit simplement de l'affichage standard d'une liste, avec des paramètres de filtres en plus ?

```bash
GET /user?age=61&page=1
```



## Codes de retour

Ne pas oublier de renvoyer les codes de retour ad hoc :
- `Status: 200 OK` (voire `201` à la création) si tout roule
- `Status: 500 Internal Server Error` en cas de problème avec le traitement de la requête.
- A noter que la plupart des serveurs web, nginx par exemple, gèrent eux-mêmes les `404` et les `301`
- Ce qui n'exempte pas de renvoyer une `404` si une requête demande un id qui n'existe pas
- erreur de validation d'une donnée : `Status: 400 Bad Request`
- requête non autorisée pour cet utilisateur : `Status: 401 Unauthorized`
- token valid mais pas possible d'effectuer l'action : `Status: 403 Forbidden`


## Sécurité

SSL, rôles d'utilisateur, authentication...

Pour l'authentication et le stockage du token d'accès, pour garantir le côté REST de l'API (statelessness), il faut **cacher le token en dehors de la session** :
- côté serveur, utiliser Redis, par exemple
- côté client : cookie ou local storage

## Documentation

L'article retient 3 outils de génération de documentation d'API :
- [Swagger](http://swagger.io/specification/) ([Open API](https://www.openapis.org/))
- [API Blueprint](https://apiblueprint.org/)
- [RAML](http://raml.org/)


## Caching

Utiliser le header HTTP `Cache-Control` :

- données sensibles : `Cache-Control: private`
- données standards : `Cache-Control: public`
- rajouter une date d'expiration (généralement courte, comme une heure)
- données ultra sensibles : `Cache-Control: no-cache, no-store`

Source : [The Ultimate Guide to API Design][source]

[source]: https://blog.qmo.io/ultimate-guide-to-api-design/
