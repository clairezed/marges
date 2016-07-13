---
layout: post
title: wappalizer
category: sustainable_code
tags: [tools]

---

Ca faisait quelques temps que je cherchais un moyen de deviner l'infra derrière un site (ausculter le code en console ), c'est chose faite !

https://wappalyzer.com/applications

existe aussi en extension








Pas sage en Seine, j'y étais passée il y a un paquet d'années, à un moment où c'était en plein coeur de Paris et où Owni existait encore. Ca m'avait eu l'air plein de gens hyper intéressants mais incompréhensibles.

J'ai gagné quelques niveaux en technique entre temps, et cette année, au niveau des dates ça pouvait coller. Quand j'ai vu le programme, je me suis dit que ça avait l'air bigrement intéressant. Alors j'ai retenté le coup.

Récit d'une moitié de Pas sage en Seine / Hacker Space Festival.



## Jour 1 (pour moi) - Samedi 2 juillet


### Avec ethereum, privilégier les dumb contracts ?

J'arrive direct en début d'après-midi sur une conférence de **@bortzmeyer**, sur un des sujets que j'ai le plus vu abordé dans les milieux tech cette année : *"Développer un contrat/programme sur Ethereum"*. Je fais justement encore un blocage cognitif sur la blockchain, j'ai donc peur de pas panner grand chose et me dis que  c'est idéal pour me rappeler les sensations de mon premier festival (sic). ça fera une très bonne transition avec ma précédente expérience du festival.

En fait, meme si ça a été en partie le cas, j'ai quand meme retiré un paquet d'infos et d'enseignements assez inspirants de cette conférence ; plutot sur des bonnes pratiques en termes de développement et de sécurité :

> "Vouloir résoudre des bogues en traitant du logiciel, c'est pas toujours une bonne idée."

Bortzmeyer analyse l'erreur du DAO (bug entrainant la perte de l'équivalent de XXXXXX euros) comme étant du à une trop forte anticipation de problèmes potentiels. En prévoyant trop de cas critiques potentiels et en les corrigeant, les développeurs ont créé malgré eux de nouvelles fragilités à leur programme.

*"le problème avec le DAO, c'est qu'on a utilisé les mêmes méthodes de productivité que le web"*, c'est à dire coder vite, beaucoup, en se disant que tant que ça marche dans les grandes lignes, c'est bon. Dans les milieux ultrasécurisés, on écrit du code hyper simple, hyper lentement, au contraire. il aurait selon lui fallu coder, non comme pour un site web, mais comme pour une centrale nucléaire.

C'est aussi peut etre un problème de syndrome un peu cowboy chez les devs (j'avoue moi y avoir parfois succombé) : les programmeurs ont tendance à aimer faire du code compliqué. Or, plus un contrat est simple et trivial, plus il est compliqué d'y introduire des bugs.

Pour Bortzmeyer, l'appellation smart contracts serait très avantageusement remplacée par celle de  **"Dumb contracts"**.
Et il ne faut pas oublier de tester ses codes de retour, aussi.

Ce n'est pas la première fois que j'entends parler des avantages à coder simple, limite un peu grossier. Plus le temps passe et plus je comprends qu'il n'y a vraiment pas de honte à coder façon paysan (un peu rustique, mais c'est du solide), et c'est une façon de faire dans laquelle je me retrouve de plus en plus.


<!-- mais... mais pourquoi "bog" est féminin pour @bortzmeyer ? Il doit me manquer une info
"il faut privilégier les dumb contracts aux smart contracts. Pas écrire pour le web, mais pour une centrale nucléaire"

grâce à @bortzmeyer , et même si y'a tjs des choses qui m'échappent ds la blockchain, je révise de bons principes de sécurité

"dans ces conditions, programmer de manière sûre, c'est assez yolo" -->






### L'ergonomie, indispensable à l'adoption massive du libre

L'intitulé de la conférence qui suit est une affirmation à laquelle j'adhère massivement : *"L'ergonomie, indispensable à l'adoption massive du libre"*. L'intéret pour moi était donc plutot d'avoir des éléments de diagnostic (pourquoi est-ce que le design peche dans le libre ?), des pistes de résolution, et voir un peu comment la communauté "hacker / libriste / engagée" (comment on définit la "communauté" de ce festival, en fait ?) recevait ce genre de discours.

Qu'est-ce que ça donne ?

> "pour une adoption de masse, il faut rendre le produit accessible au maximum"

Là-dessus, les deux intervenants, venus de Cozy Cloud, prechent une convaincue. Mais ils enfoncent le clou et insistent, en parlant au sujet du développement de produits open source de *"relation egosexuelle"*, travers par lequel on se retrouve à réaliser un produit pour soi, ses usages, sa communauté. Une manière de rappeler que, lorsqu'on bosse pour de l'open source et qu'on essaye de se positionner en alternative aux GAFA, la logique veut qu'on soit accessible au plus grand nombre.

> "Si tout ce qu'on arrive a libérer, c'est que de la ligne de code, et bien on aura perdu."

Comment fait-on ? Les méthodes décrites et appliquées par l'équipe de Cozy sont finalement relativement connues, mais c'est souvent pas inutile de répéter les bonnes pratiques : connaitre ses utilisateurs, savoir à qui on s'adresse, et avoir conscience qu'on est *"qu'un utilisateur parmi d'autre"* (et meme pas un utilisateur représentatif, vu qu'on connait son produit dans les moindres détails).

Ca a parlé ensuite pas mal de "se focuser", "user experience", "user centric"... Beaucoup de vocables anglo ou franglo-saxons (c'est le domaine qui veut ça, hein), et notamment des mots que j'avais ces derniers temps principalement vu utilisés pour camoufler des concepts fumeux, et faire passer des projets rempli de vent pour des projets innovants. Je découvre donc que ces mots sont aussi utilisés sans chichi dans la communauté open source. Mes repères anti-bullshit s'effondrent.

En fin d'intervention, un retour sur la distinction entre ergonomie et design ; tout le monde pouvant contribuer à la première et donner des conseils pour l'améliorer, le design devant rester entre les mains du designer. Malgré tout, rien n'oblige à suivre strictement les conseils et avis des utilisateurs. "si j'avais demandé aux gens ce qu'ils voulaient, ils auraient dit Des cheveaux plus rapides"

> "on a besoin de la contribution des utilisateurs, mais notre devoir est de les inspirer à aller plus loin"

pourquoi c'est compliqué, entre l'os, l'ergo et le design ? Déjà, rien que l'install est compliquée





"ergo = créer une solution avec ses utilisateurs pour qu'ils se sentent à le maison"

"user-centric", "user experience", "focuser"... c'est toujours plein d'anglicisme les présentations d'ergo

comment faire ? Faut trouver ses utilisateurs, discuter avec eux, analyser, faire des prototypes simples...

 point "challenger". Ca a parlé" disrupté" aussi tout à heure. C'est con, mais je tique toujours un peu
    je crains que se soit indissociable du domaine :-/
faut réussir à distinguer les fois où l'utilisation de ces termes cache du vent
    ça m'a surpris mais j'ai pas trop entendu de vent dans cette conf
oui oui, pas du tout dans les confs ici ! mais les précédentes fois où je les ai entendu, c'était vachement plus"venteux"
 et donc j'ai tendance à assimiler ces termes à des atmosphères venteuses, (ouais, j'amalgame un peu)



"tout le monde n'est pas ergonome, mais tout le monde peut contribuer à l'ergo, et apporter des conseils. Pas en design."

"est-ce que qu'on peut open sourcer du design ? Vraie question. Cf mozilla.open-sourcing.brand"

[Les slides](http://talks.m4dz.net/open-source-ux/#1)

### Vers un design libre

"un système technique n'est pas neutre" conf design libre

parlzme de prosommateur, où la personne s'implique dans la production de l'objet qu'il utilise

#prosommateur : cf amap où tu peux payer tes paniers soit en temps de travail, soit en fric

y'a des notices d'Entropie qui me font grave de l'oeil ( https://www.asso-entropie.fr/fr/design-libre/notices/carriole-serigraphier/)

on en vient à discuter modèle économique quand on est dans le don : les recherches sont financées

recherche financées par formation (personne ayant un besoin spécifique), ou subventions

une fois qu'un projet à été financé une fois, il peut être diffusé

atelier paysan, à Grenoble, aide les paysans à produire leur propre outillage

Entropie part symétriquement des besoins et demandes, pas de création d'objets "pour voir"


Petit moment de pause, je descends au village associatif et en profiterait pour louper intégralement sans m'en rendre compte l'intervention sur les cafés vie privée.

A la place, je discute quand meme avec


### PSES+HSF Debout ! Le Syndicat d'Initiatives

Discussions sur comment peu à peu freelancer pour la cause -> la question se résume aussi à "Où est le fric ?" Bosser qq jours pour des grands comptes pour réserver le reste à de la militance ?

### FFDN

Découverte de la Brique, avec du YunoHost



### Vers un web decentralisé ?

pq on fait des services centralisés ? Parce que c'est faciiiiiiile, pas trop cher, etc.

 "dht, decentralized hash table", c'est là que j'ai peur de ne plus tout saisir

BitTorrent passe mtnt par MainlineDHT, pour éviter centralisation des trackers. Je mets ça là pour si j'ai le temps de fouiller

zeronet, mix BitTorrent et bitcoin

maintenant ca cause webRTC, un truc dont j'ai + entendu parlé (ça doit être à cause du "web" dans le titre)

encore une mention du DAO, avec des petits toussotements

expérience cool de contrôle de chauffage via wifi, "jusqu'au moment où j'ai plus eu internet et j'ai eu froid"



## Jour 2 - Dimanche 3 juillet

Raté la conf sur educ pop, encore un sujet convaincu


### Salaire à vie


### Il etait une fois l'internet




### LQDN



### Twitter émotions



### Community Organizing



Premier Club Maté pour moi (il était temps), pris à 16h, je m'attends à pas fermer l'oeil de la nuit.


Bilan

Des thématiques plus ouvertes sur de la politique non technique / + grand public (mais je sais pas 1/ si mon regard est pas biaisé ; 2/ si le public habituel s'y retrouve)


#PSESHSF pour retrouver les confs (et mon flood de tweets sur certaines)


Source : [La politisation de la question technologique, condition d'un nouveau contrat social][source]


[source]: http://www.huffingtonpost.fr/diana-filippova/la-politisation-de-la-que_b_10707504.html






Titre ou sujet :         Remise des Bullshit Bingo d'Or 2016
Intervenants :         Emmanuelle Macro et Alain Mince (Brice Tuturier juste au téléphone). On pourrait avoir un appel de  Axelle L'Amer +1+1
Description :          Le classement tant attendu des Bullshit Bingo Awards sera révélé par notre jury constitué d'investisseurs panaméens, de vieilles pousses et de chômeurs devant un parterre de décideurs et de jeunes poulets sous vide.


Comment ça marche (pas) ?

Vous mettez un +1 après chaque entrée pour laquelle vous voulez voter +1
Vous pouvez voter pour une ou 2 entrées par catégorie.
Essayez de remplir dans toutes les catégories :)
On compte les voix, et on distribue les awards ce samedi 2 à 19h00 :)


Prix du Bullshit Job de l'année
Devops +1+1+1+1+1+1+1+1+1+1+1+1+1+1+11+1+1
[...] Guru+1
*-ninja+1+1
Scrum master
Évangeliste +1
Associé On Purpose +1+1+1+
Growth Hacker +1+1+1
LIFE HACKER+1
CHIEF HAPPINESS OFFICER +1+1+1+1+1+1+1
Coach agile +1+1+1+1+1+1+1+1+1+1+1+1 +1+1
CTO
CEO
CDO (Data / Digital)
Data scientist +1
Lead Dev
Lead QA
Directeur Program Manager +1+1
Red-team
RH


Le Prix du Bullshit Word qui a perdu de la vitesse depuis 2015
Crowdsourcing +1+1 +1
Bitcoin+1+1
IaaS / *AAS +1+1+1+1+1+1+1+1+1
accélérateur de croissance +1
scalabilité+1+1+1+1+1+1+1+1+1+1
résilience+1+1+1+1
coworking
Imprimante 3D +1+1+1+1


Le Prix du Bullshit Word de 2016
Internet of Things +1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1
Growth Hacking
VR
Blockchain +1+1+1+1+1+1+1+1+1+++++++1
Voiture sans chauffeur / Google Car (car as a service ?)
machine learning / neural networks+1
Community engagement(happiass)
Employee engagement
predictive analytics (Tessier aaS)
open innovation (open * [comme l'open source])
LEAN +1
SCRUM
AGILE+1
SPRINT
*Digital* (en francais)+1+1+1+1+1+1+1+1m+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1
Innovation disruptive +1+1+1+1
Licorne <3
uberisation de *+1+1+1+1+1+1+1
civic tech ,
foodtech
fintech
lowtech+1
Silver Economy / l'or gris
4K+1  -> 5K
Cuisse de poulet^^
DAO +53 M$ haha
gougleu
+1 aussi pour Digital<censored> <=== Culay ! <= <censored>
+1 : "digital penetration" c'est la "pénétration du numérique" et pas...
Il manque totalement le « DARKNET » ;) /me agrees+1+1+1

Le Prix du Bullshit Word qui a un gros potentiel pour 2017
FlexOffice
Internet Of Cars +1+1+1+1+1+1+1+1+1+1
Intenet of things as++11+1+1+1+1+1+1+1+1+1+@+1+1+1+1+1+1+1+1+1+1+1+1
Smart contract
Uberiser Uber
VR
herméneutique (référence nécessaire)
Internet des grosses merdes surtout...

Prix du Bullshit de l'innovation d'État
Le Hackaton pour mieux fliquer les gens +1+1+1+1+1+1+1+1
http://www.paris.fr/necmergitur
Pôle emploi ... user centric et disruptif +1+1+1
http://www.journaldunet.com/management/ressources-humaines/1176880-anne-leone-campanella-pole-emploi/
Startups d’État +1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1
http://www.modernisation.gouv.fr/ladministration-change-avec-le-numerique/par-des-services-numeriques-aux-usagers/startups-d-etat
Lapsus...
http://rue89.nouvelobs.com/2016/06/07/numerique-doit-etre-reserve-happy-few-264279


Prix du Mot Bullshit de la décennie
Big Data +1+1+1+1+1+1+1
Cloud+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1
Startup +1+1
Digital +1+1+1+1+1+1+1+1+1-1
Internet of *
INNOVATION
IA (du siècle ?)+1+1 <<<<<<<<<
TayAi
Singularité
Machine learning
Tout ces mots doivent avoir ce prix !+1+1+1+1+1
Je valide cette opinion :')

Prix du Bullshit des filles et fils à papa
Bullshiters As A Service +1+1+1
https://cremedelacreme.io/
La Learning Touch
https://www.digischool.fr/hype/
L'écosystème entrepreneurial X +1+1+1+1+1+1+1+1
https://www.polytechnique.edu/fr/breve/lecole-polytechnique-lance-son-accelerateur
Stagiaires On Purpose  +1
https://jobs.ouishare.net/
L'esclavage DIY +1+1+1+1+1+1+1+1+1+1+1+1+1+1+1
http://www.lemonde.fr/campus/article/2016/05/22/a-fresnes-de-jeunes-passionnes-d-informatique-hackent-les-codes-de-l-entreprise_4924060_4401467.html

Prix spécial du jury : le coup de coeur
Power Networker +1 +1+1
http://www.meilleurdevdefrance.com/
Pitch As A Service
http://makestorming.com/outils/pitchmotion
Même Challenges (!) s'y met +1+1
http://www.challenges.fr/high-tech/20160107.CHA3639/high-tech-start-up-frenchtech-jouez-au-bullshit-bingo-du-ces-2016.html
Les plus belles pages du corporate ("Intrapreunariat")
http://www.thebosonproject.com/#!noslivres/c11a4
Webcomic Strip +1+1+1
http://www.commitstrip.com/fr/2016/06/20/coder-bingo/?
Le Bullshit qui vient +1
http://i.imgur.com/oNwl8Qa.png
Le Bullshit Intello-technique "hypercontrôle computationnel" +1
http://enmi-conf.org/wp/enmi15/
Le Camp à Bobos "able to adapt"+1+1+1+1
http://darwin.camp/
LLeLe

Prix de l'entreprise (au sens large) qui pratique le mieux le greenwashing, hackerwashing, le *washing
Le yaourt inter-entreprise qui innove sec
 http://programmenoe.com/
#CompteurConnect  +1+1+1+1+1+1+1
http://www.developpement-durable.gouv.fr/Hackathon-CompteurConnect-le
MAIF La blockchain au service de ton assureur+1+1+1+1+1+1+1+1+1+1+1+1+1+1
www.meetup.com/fr/La-Paillasse-Events/events/222566200/
Point bonus buzzword-combo pour le communiqué presse MAIF-CozyCloud "A la MAIF, nous sommes fiers d’accompagner la croissance de Cozy Cloud et d’amorcer avec elle un nouveau paradigme autour du self data. MAIF est convaincue de la capacité de Cozy à être disrupteur sur le sujet"
vous savez que la MAIF est pas une entreprise les gens ? > c'est encore mieux :) /me lol <=== Pour être une merde, on a pas besoin être d'une origine particuliere
SNCF "Kick Off camp & 17 semaines de training"
http://tektos.co/sncf-tektos/

Prix Pixelle Lemaire : la meilleure redistribution d'argent public / opération de com' gouvernementale / publique
Le "pré-accélérateur lean" +1
https://lafonderie-idf.fr/appel-a-participations-nestin/
La Salle Tatami Coworking Place d'État +1+1+1+1+1+1+1+1+1
http://superpublic.fr/

Prix du meilleur outil anti-Bullshit
La police de caractères qui dénonce grave +1+1+1+1+1+1+1+1+1
http://www.sansbullshitsans.com/
Le Response GIF +1+1+1+1
http://www.gifbin.com/bin/052009/1242749315_bullshit_amplifier-detector.webm
Jouez en réunion ! +1+1+1+1+1+1+1+1??
http://www.bingoreunion.fr/
Faites vos grilles ! +1
http://www.bullshitbingo.net/cards/buzzword/
Un générateur
http://www.bullshitgenerator.com/

Prix Bullshit Bingo de Gauche
Convergence des luttes
acquis social / acquis sociaux
empowerment / émancipation/encapacitation/enpouvoirement/encapacitance+1+1+1
cloud personnel +1+1+1+1+1+1+1+1+1
Méta données
ECO*+1+1
BIO*+1+1+1
Lanceurs d'alerte+1+1
lowtech
* debout
je suis *
Je connais ni ma droite ni ma gauche (du moins en politique) mais s'ils sont contre les lancers d'alerte, alors c'est de la grosse merde...+1+1
entendu récemment, cloud privé/public/hybride

Prix de la persévérance pour l'OS Souverain / Logiciel Souverain
OS Souverain +1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1
Antivirus Souverain
Logiciel Souverain
L'intelligence artificielle Souveraine
Cloud Souverain +1
Il faut bien des logiciels Souverains pour faire tourner un OS Souverain
On se contentera de logiciels propriétaires grâce aux contrats avec Microsoft <=== Ouais mais c'est que pour l'Éducation nationale et la Défense Nationale et l'enseignement sup/recherche !
Et un point Godwin pour Alban :)

Prix de la récup' des hackers
Les Makers, ils impriment des immeubles... +1+1
http://www.futurapolis.com/manifeste/
Le magasin qui se présente comme un lab +1
http://www.brocantelab.com/
T'as un projet ? On va t'aider... +1+1
http://www.thisispollen.com/#home
Hackers à vendre
https://www.hackster.io/business
*SPACE
*FABLAB
Techshop
*LAB +1+1+1+1+1+1+1+1+1+1+1+1+1+1+1 /tmp/lab <===+1



Prix Le Bon Bullshit De Nos Régions : les techshops a ROI sur l'innovation
Aquitaine ! +1+1
http://www.aquitaine-developpement-innovation.com/
Ile de France !
http://www.silvervalley.fr/Silver-Valley-12
Ile de France !
https://lafonderie-idf.fr/equipe/
Orléans ! +1+1+1+1+1+1+1+1
http://www.le-lab-o.fr/
Loire ! +1+1
http://frenchtech-loirevalley.com/#section-presentation
Lyon !
http://www.digitalsummr.com/fr/programme/programme
Brest ! (plus) <=== Avec Brest, Molaix, Quimper et Lannion (d'où le "plus" !) La première *TECH augmentée...
http://thebresttechblog.tumblr.com/
http://frenchtech-brestplus.bzh/ <=== avec .bzh !


Rappel Source  :

    https://pad.lqdn.fr/p/bullshit_bingo_awards_pseshsf






