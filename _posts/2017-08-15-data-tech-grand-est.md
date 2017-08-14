---
layout: post
title: Data ess grand est
category: good_job
tags: [et moi]

---



<!--more-->


Extraire les 10 premières lignes pour études

```bash
head -n 10 sirc-201707_L_M.csv > sirc-201707_L_M_10_first_lines.csv
```

On découvre que les données sont de ce format là :
"SIREN";"NIC";"L1_NORMALISEE";"L2_NORMALISEE";"L3_NORMALISEE";"L4_NORMALISEE";"L5_NORMALISEE";"L6_NORMALISEE";"L7_NORMALISEE";"L1_DECLAREE";"L2_DECLAREE";"L3_DECLAREE";"L4_DECLAREE";"L5_DECLAREE";"L6_DECLAREE";"L7_DECLAREE";"NUMVOIE";"INDREP";"TYPVOIE";"LIBVOIE";"CODPOS";"CEDEX";"RPET";"LIBREG";"DEPET";"ARRONET";"CTONET";"COMET";"LIBCOM";"DU";"TU";"UU";"EPCI";"TCD";"ZEMET";"SIEGE";"ENSEIGNE";"IND_PUBLIPO";"DIFFCOM";"AMINTRET";"NATETAB";"LIBNATETAB";"APET700";"LIBAPET";"DAPET";"TEFET";"LIBTEFET";"EFETCENT";"DEFET";"ORIGINE";"DCRET";"DDEBACT";"ACTIVNAT";"LIEUACT";"ACTISURF";"SAISONAT";"MODET";"PRODET";"PRODPART";"AUXILT";"NOMEN_LONG";"SIGLE";"NOM";"PRENOM";"CIVILITE";"RNA";"NICSIEGE";"RPEN";"DEPCOMEN";"ADR_MAIL";"NJ";"LIBNJ";"APEN700";"LIBAPEN";"DAPEN";"APRM";"ESS";"DATEESS";"TEFEN";"LIBTEFEN";"EFENCENT";"DEFEN";"CATEGORIE";"DCREN";"AMINTREN";"MONOACT";"MODEN";"PRODEN";"ESAANN";"TCA";"ESAAPEN";"ESASEC1N";"ESASEC2N";"ESASEC3N";"ESASEC4N";"VMAJ";"VMAJ1";"VMAJ2";"VMAJ3";"DATEMAJ"
"000325175";"00057";"MONSIEUR THIERRY JANOYER";"TAHITI PERLES CREATION";"";"61 RUE MARX DORMOY";"";"13004 MARSEILLE";"FRANCE";"MONSIEUR THIERRY JANOYER";"TAHITI PERLES CREATION";"";"61 RUE MARX DORMOY";"";"13004 MARSEILLE 4";"";"61";"";"RUE";"MARX DORMOY";"13004";"";"93";"Provence-Alpes-C�te d'Azur";"13";"3";"98";"204";"MARSEILLE 4";"00";"7";"59";"200054807";"73";"9310";"1";"TAHITI PERLES CREATION";"1";"O";"201401";"3";"Artisan ";"3212Z";"Fabrication d'articles de joaillerie et bijouterie";"2014";"00";"0 salari�";"NN";"2014";"1";"20140107";"20140107";"";"";"";"P";"S";"O";"";"0";"JANOYER*THIERRY/";"";"JANOYER";"THIERRY";"1";"";"00057";"93";"13204";"";"";"";"3212Z";"Fabrication d'articles de joaillerie et bijouterie";"2008";"";"";"";"00";"0 salari�";"NN";"2014";"PME";"20000926";"201209";"1";"S";"O";"";"";"";"";"";"";"";"";"";"";"";"2014-01-08T00:00:00"


### Etape 1 - écrémage
script 00 : réduire le nombre de lignes pour pouvoir manipuler les fichiers
Ici, on fait pas dans le raffiné, pas de DictReader, pas de pandas, car ils n'y arrivent pas et parce que les données sont formatées n'importe comment. Là, faut tailler à la cerpe.

Vérif
```bash
head -n 10 tech_grand_est_00.csv > tech_grand_est_00_fl.csv
```

## Etape 2
script 01 : continuer à réduire

## Etape 3

Cast, formattage

cf [Useful Pandas Snippets](https://gist.github.com/bsweger/e5817488d161f37dcbd2)

## Analyse

### OpenRefine

Le plus de structures Tech :
67: 2596
57: 1332
54: 1222
68: 1214
51: 885
88: 469
10: 432
8 : 218
70: 202
90: 171
55: 150
52: 138

Secteurs d'activité dans les Vosges :
6201Z:  130
7410Z:  110
7311Z:  93
6202A:  73
6209Z:  26
6202B:  16
6312Z:  15
6203Z:  6

Dans tout Grand Est :
6201Z - Programmation informatique: 2586
7410Z - Activités spécialisées de design: 1968
6202A - Conseil en systèmes et logiciels informatiques: 1672
7311Z - includeeditActivités des agences de publicité: 1588
6209Z - Autres activités informatiques: 569
6312Z - Portails Internet: 317
6202B - Tierce maintenance de systèmes et d'applications informatiques: 207
6203Z - Gestion d'installations informatiques: 94
5829A - Édition de logiciels système et de réseau: 28

## Structures tech

Je m'appuie pour les structures tech sur la première liste établie par XXX
Je vais vérifier les quotes à l'[insee](https://www.insee.fr/fr/metadonnees/nafr2/division/62) (au passage : bon point pour l'insee, j'ai trouvé leur interface claire, pratique, bien pensée). Je devrais pouvoir me passer de certains codes ("Télécommunication par satellite", par exemple), mais il me semble qu'il m'en manque. Les agences de publicité, par exemple. Je vais vérifier les codes APE de certaines structures que je connais sur [societe.com](https://www.societe.com/cgi-bin/search), histoire d'affiner.

Je décide finalement de me concentrer sur les codes suivants :


Codes NAF ou APE :

5829A : Édition de logiciels système et de réseau
- Cap collectif

61    : Télécommunication
6110Z : Télécommunications filaires
6120Z : Télécommunication sans fil
6130Z : Télécommunication par satellite
6190Z : Autres activités de télécommunication

62    : Programmation, conseil et autres activités informatiques
6201Z : Programmation informatique
- Splitfire
- Neftis
- Fluicity
- Scopyleft
6202A : Conseil en systèmes et logiciels informatiques
- Ceryom
- Ochelys
6202B : Tierce maintenance de systèmes et d'applications informatiques
6203Z : Gestion d'installations informatiques
6209Z : Autres activités informatiques
- Ornitorinc

63    : Services d'information
6311Z : Traitement de données, hébergement et activités connexes
6312Z : Portails Internet
- OSP
6391Z : Activités des agences de presse
6399Z : Autres services d'information n.c.a.

7022Z : Conseil pour les affaires et autres conseils de gestion
- Anamorphik

73    : Publicité et études de marché
7311Z : Activités des agences de publicité
- Section4
- Toucan Toucan
- Studio HB

### Design

7410Z : Activités spécialisées de design
- Plausible Possible
- User Studio


## Conclusions

Choper des sources et apprendre à les connaître demande aussi vachement de temps. Et encore, je n'étais que sur des données ultra balisées.

Apprendre de nouveaux outils, c'est toujours ultra long (ici : pandas + carto).

Sur pandas, compliqué de gérer des colonnes non uniformes (avec des chiffres (88) et des lettres (2A), des booleans renseignés de différentes façons suivant les colonnes), et le système de typage de pandas reste encore un mystère pour moi.

Je reste toujours sacrément plus à l'aise sur des outils visuels, mais apprendre un peu de python m'est + qu'utile pour les gros traitements impossibles à faire par d'autres moyens (fichiers de plusieurs gigabytes...)

J'ai toujours le doute, sans retour visuel à la toute fin, de faire un peu n'importe quoi des données (surtout quand je fini par faire des traitements rustiques à la main), donc vraiment ne prenez pas trop pour argent comptant les résultats de mes études. Merci !


Je découvre sur le tard des outils qui m'auraient peut-être permis de vachement moins m'emmerder :
- [API Sirene](https://data.opendatasoft.com/explore/dataset/sirene%40public/api/) proposée par OpenDataSoft. En plus les adresses sont déjà géocodées.
