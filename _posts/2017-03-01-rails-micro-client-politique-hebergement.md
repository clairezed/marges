---
layout: post
title: Rails et micro-client, quelle politique d'hébergement ?
category: good_job
tags: [ess, et moi]

---

Solo + 1 mois.

<!--more-->

## La confrontation de deux référentiels

Concrètement, mon cas actuel : une petite asso que je connais me demande un devis pour un site. Plutôt un petit site, fréquentation probablement faible, quelques centaines d'enregistrement en base pour commencer, quelques milliers peut-être d'ici 1 an ou deux. Pas de soucis sur l'estimation du temps de travail, mais là où ça coince plus, c'est sur l'estimation des coûts d'hébergement.

Mes références en matière d'hébergement me viennent de l'expérience Studio HB, où 3 cas de figure se présentaient :
- heroku : clients fortunés qui payent directement, et là ils sont à entre 200 et 500$ par mois ; bon c'est un peu hors-norme. Dans l'idéal, j'estimerais à 1 dyno standard, et peut-être à terme rajouter du postgres (soit grosso modo 35 € / mois). Au démarrage, la version hobby pourrait suffire (soit donc au minimum 7 $ /mois, 84 $ /an)
- serveur mutualisé en interne : hébergement sur un gros serveur géré par la boite. Le serveur coûte en gros 35 ou 40 € /mois; et je ne sais pas précisément combien ils facturent aux clients (mais je pense pas moins de 20 ou 30 € par client, pour avoir un bon revenu régulier)
- serveur dédié : tout dépend de la config requise, mais généralement ce sera minimum du 30 € / mois (ce sont généralement des projets un peu costauds qui demandent ça)

En face, les références de mon client sont les suivantes :
- un de leur site fait en php tout standard est hébergé sur le serveur mutualisé de leur prestataire, pour le coût de ... 18€ / an. 1,5€ /mois. Ouch.

Autant dire que les références sont difficilement conciliables.

D'où les questions suivantes (si certaines te paraissent trop indiscrètes, tu peux les passer, hein) :
- quel est le coût minimum d'hébergement que tu arrives à proposer pour des petits projets ? avec quelle offre d'hébergement ?
- comment argumentes-tu quand on te dit "c'est trop cher, un autre prestataire héberge des sites à 18€ par an !" ?
- comment estimes-tu le type de serveur qu'il te faut en fonction du projet ?

Pbtique potentielle à anticiper : l'hébergeur actuel cesse ses activités ; nécessité de prendre aussi l'hébergement du site actuel ?

## Options 1 : cloud de base


### Barillot :
Heroku? Sinon OVH est hyper pas cher pour les VPS, mais un peu de boulot pour la conf. S3 pour le storage, là y'a pas photo
en fait, ça dépend du suivi. Si c'est one shot et j'oublie: Heroku. Si c'est perso et que tu veux jouer: OVH tout-à-la-main
certes, d'un autre côté c'est vite monté, et puis les updates d'OS, les backups etc... c'est ce que j'appelais "suivi"
si tu regardes surtout le prix, IMHO, OVH est imbattable. Faut se taper la conf., les backups... mais ça peut être fun :-)
ha ben justement, si ils ont déjà un Wordpress quelque part, tu peux aussi héberger les 2 sur le mme VPS...

### Zef
solutions VPS + AWS S3 possibles, avec Ansible pour le setup. Ou autre soluce OVH avec Docker... J'ai bon ?
sinon il a de très bonne solution Scaleway pas chères... Et toutes prêtes !

### Verrot
Une t2.micro (1GB) "reserved" sur EC2 c'est $124 pour 3 ans ($3.5/mois), $272 ($7.5/mois) la t2.small (2GB)
et pour RDS avec PG dessus, ça commence à $292/36 mois (± $8/mois). Donc faut compter < $20/mois sur AWS
Check ECS et Elastic Beanstalk. Ca va rendre ta vie tellement simple... :-D
y a une belle learning curve, mais quand le budget humain est moins regardé que le budget tech, ca vaut le coup

@ScalingoHQ nos prix commencent à 7,20€ pour un container 'S', ça fait tourner du Rails un peu optimisé :)


### Camille Appert
Je pense que le plus simple c'est que tu pose ca sur un serveur à toi et tu facture zéro euro
Tu peux te rattraper sur le forfait maintenance
l’Autre Net, hébergeur associatif autogéré
*ouais, j'y ai pensé à serveur à moi mais 1/ pour le moment j'en ai pas, donc ça veut dire investir pour un seul client ; 2/ J'ai pas mal de retour de gens qui se mordent les doigts au final d'avoir fait de l'hébergement (hyper galère quand tu veux arrêter, hyper galère à maintenir quand t'as plein de systèmes différents sur un serveur...)
bref, j'essaye de fuir cette solution. Guillaume lui me parlait des VPS ovh à moins de 5€/mois, je pense que ça, ça passe*

Oué mais ca multiplié ton budget par 5

Qd je disais serveur ca peut être vps
L'idée c'est que tu mutualise tes clients

ah oui + la db si tu veux un truc correct
Si c'était moi je partirai sur Heroku quitte a me bouffer de la marge, pour du rails
*plus qu'une install fait main sur un petit vps ovh, alors ? https://www.ovh.com/fr/vps/vps-ssd.xml*

Ben j'apporte aucune valeur à configurer un serveur, ma valeur c le conseil au client, l'adéquation des besoins...
Chaque seconde passée à maj ruby, configurer le serveur, c'est une seconde de perdue


+ Cf mail Laurent SHB / Zef 
