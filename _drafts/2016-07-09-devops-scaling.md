---
layout: post
title: scaling devops
category: sustainable_code
tags: [tools, scaling, devops, nginx]

---



Je lutte contre une tendance à vouloir en faire trop, à optimiser, factoriser de façon trop précoce, et suis toujours à la recherche de moyens de faire qui permettent à la fois d'^etre léger et rapide, à la fois d'etre réactif et flexible pour pouvoir réorienter quand il faut.


Donc, quand un article me promets des astuces et procédures simples à mettre en place, c^oté architecture, pour permettre si l'occasion se présente, de na pas avoir un serveur qui saute en cas de succès (et donc, de manière régulière, pour alléger la charge sur le serveur), je lis avec attention.

Trois actions préconisées, qui, après quelques installations, peuvent etre faites en une heure :

### Tester le temps de chargement de son site

[**Loader.io**](https://loader.io/), dans sa version gratuite, permet de tester la réponse de son site jusqu'à 10 000 requetes par minute (ce qui suffira généralement à faire tomber un site non optimisé)

A savoir : Loader.io ne supporte que http/https. Pour des sites exploitant d'autres protocoles de communication, il faudra passer par d'autres outils (Meteor et ses websockets -> penser à  [MeteorDown](https://github.com/meteorhacks/meteor-down) ou [Kadira](https://kadira.io/))

Cet étape permet de savoir si son site a VRAIMENT besoin d'optimisation. Etape à répéter après chaque optimisation, pour déterminer s'il faut continuer ou non.

### Utiliser un proxy pour atténuer la charge du serveur

Un serveur [**Nginx**](http://nginx.org/en/docs/beginners_guide.html) à la rescousse pour servir de*"caching load-balancing reverse proxy"* (ma capacité de traduction atteint souvent ses limites dans le domaine de l'administration système....)

Comme Nginx permet de faire un paquet de choses, on s'y paume souvent dans sa configuration, mais l'auteur de l'article est un vrai chic type et partage sa configuration type, que je me permet de retranscrire ici :

```vim
proxy_cache_path  /var/cache/nginx/sidebar levels=1:2 keys_zone=SIDEBAR:10m inactive=24h  max_size=1g;

# LOAD BALANCING ===================
# Load Balancer : it can farm requests out
# to multiple back-end servers instead of just one.
upstream sidebar {
    ip_hash;

    server xxx.xxx.xx.xxx:80;
    server yyy.yyy.yy.yyy:80;
}

server {
    listen 0.0.0.0:80;
    server_name sidebar.io;

    access_log /var/log/nginx/sidebar.access;

    set $skip_cache 0;
    location / {
        # PROXY STARTS HERE ========
        # configures NGINX to be a reverse proxy :
        # - it forwards requests on to your web app
        # - fetches the response,
        # - and returns the response to the requestor.
        proxy_pass http://sidebar/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $http_host;

        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forward-Proto http;
        proxy_set_header X-Nginx-Proxy true;

        proxy_redirect off;

        # CACHING STARTS HERE ========
        # sets NGINX up to be a cache :
        # NGINX can store some of the responses
        # and return the results without ever
        # hitting the back-end app server.
        if ($cookie_meteor_login_token) {
            set $skip_cache 1;
        }
        proxy_cache_bypass $skip_cache;
        proxy_no_cache $skip_cache;
        proxy_cache SIDEBAR;
        proxy_cache_valid 200 30s;
        proxy_cache_use_stale error timeout invalid_header updating http_500 http_502 http_503 http_504;
        proxy_ignore_headers "Cache-Control" "Expires";
        add_header X-Cached $upstream_cache_status;
    }
}
```

Conseils et remarques pour le cache :

- inadéquat pour des sites aux données très dynamiques. mais souvent, la page d'accueil, celle qui reçoit le + de trafic, est statique : mettre en cache celle-ci et pas les autres pages, + dynamiques.
- si des données sensibles transitent dans les réponses du serveur, ne pas les mettre en cache ! (d'où dans la config ci-dessus la variable `$skip_cache`)


### Utilisez un CDN  pour que le site charge plus rapidement, de n'importe où

La version gratuite du Content Delivery Networks [Cloudflare](https://www.cloudflare.com/) fait apparemment déjà des miracles. Voici ce que pointe l'auteur de l'article :

- chargement + rapide des assets
- HTTPS en un click
- protection contre les attaque DDoS






Source : [Minimum Viable DevOps][source]


[source]: https://medium.freecodecamp.com/minimum-viable-devops-919972dfd9e0#.58j5845b3




