---
layout: post
title: L'appel des SIRENE
category: sustainable_code
tags: [données, cartographie]

---

Un jour de pont, succomber à l'appel des données ouvertes du répertoire SIRENE, se prendre quelques récifs, mais découvrir quand même de jolis recoins.



<!--more-->

Comme les journées sont plus longues l'été, encore plus les week-end de pont, j'ai profité de la mi-août pour me plonger gouluement dans le répertoire SIRENE et joindre l'utile à l'agréable.

L'agréable : jouer avec des données, apprendre à les manipuler (traitement, nettoyage, visualisation), découvrir les terribles secrets qu'elles renferment.

L'utile : choisir des terrains d'exercice tout à fait intéressés, ausculter les organismes de l'Economie Sociale et Solidaire (ESS) du coin (potentiels clients) et pister les boites de com' ou de développement des environs (potentiels concurrents ou partenaires).

Ci-dessous, un résumé du déroulé des opérations, où je vous épargnerai le détail des impasses et faux plans dans lesquels je me suis laissée embarquer, pour directement sauter aux solutions que j'ai pu trouver.

*Précision : je parle ici du haut de mon expérience de quelques bonnes poignées d'heure. Il va sans dire que mes solutions sont probablement loin d'être les plus efficaces ou pertinentes. Mais ça épargnera peut-être quelques heures de galère à ceux qui se lancent comme moi tête la première dans un océan de données. Au moins, ça les épargnera à mon moi futur, quand il lui reprendra de tripatouiller de la donnée.*


## Ma boîte à outils

En guise d'introduction, voilà les outils que je me suis retrouvée à exploiter pendant ma quête du 15 août :

- python
- un tableur basique
- [pandas](https://pandas.pydata.org/), librairie python d'analyse des données
- [carto](https://carto.com/), service de cartographie et d'analyse de données en ligne
- [openRefine](https://my.datascientistworkbench.com/tools/openrefine), logiciel libre de nettoyage et de mise en forme de données.

## Traitement

### Etape 1 : Trouver les données et les comprendre

L'ouverture du répertoire SIRENE début 2017 est quand même une formidable opportunité d'en savoir plus sur la typologie des organisations en France. Les données sont maintenant accessibles en csv, mises à jour tous les jours.

Pour les trouver, rendez-vous sur [www.data.gouv.fr](https://www.data.gouv.fr/en/datasets/base-sirene-des-entreprises-et-de-leurs-etablissements-siren-siret/).

Si vous voulez l'intégralité des donnés et non les mises à jour quotidiennes, bien télécharger un fichier "stock" de début de mois. Vous devriez pas vous tromper : si vous mettez moins de 10 minutes à le télécharger, a priori c'est pas le bon (8,6 GB tout de même).

Ensuite, pour savoir quoi chercher, arpenter la nomenclature. Un [pdf explicatif](https://www.sirene.fr/static-resources/doc/dessin_L2_description_complete.pdf?version=1.14) est disponible, ce qui épargnera les allers-retours pénibles dans la [liste des variables sirene](https://www.sirene.fr/sirene/public/static/liste-variables) en ligne. (je me suis fait un petit  [pense-bête](https://gist.github.com/clairezed/cd69498f75a3e2768eef54e7af3c7536) un peu plus synthétique).

J'apprends qu'il y a une [variable ESS](https://www.sirene.fr/sirene/public/variable/syr-ess), c'est celle-là que je vais utiliser pour commencer et cibler les organismes dans le champs de l'ESS.

Pour les structures faisant potentiellement du développement web, j'ai commencé par aller chercher les codes APE de quelques sociétés auxquels je me compare (une recherche sur [societe.com](https://www.societe.com/cgi-bin/search) suffit bien), puis ai fouillé ces codes et les codes proches sur le site de l'[insee](https://www.insee.fr/fr/metadonnees/nafr2/division/62) (au passage : bon point pour l'insee, j'ai trouvé leur interface claire, pratique, bien pensée).

Je garderais les codes suivants :
- 5829A : Édition de logiciels système et de réseau
- 6201Z : Programmation informatique
- 6202A : Conseil en systèmes et logiciels informatiques
- 6202B : Tierce maintenance de systèmes et d'applications informatiques
- 6203Z : Gestion d'installations informatiques
- 6209Z : Autres activités informatiques
- 6311Z : Traitement de données, hébergement et activités connexes
- 6312Z : Portails Internet
- 7022Z : Conseil pour les affaires et autres
- 7311Z : Activités des agences de publicité


### Etape 2 : vérifier les données

Pour avoir une idée un peu plus précise de la tête des données, vérifier quels champs sont bien présents dans le fichier qu'on a récupérer, je conseille  d'en extraire dans un fichier temporaire les 10 premières lignes, pour études.

En console :

```bash
head -n 10 source.csv > destination.csv
```

Ce qui permet de découvrir que les données ont cette tête-là :


```
"SIREN";"NIC";"L1_NORMALISEE";"L2_NORMALISEE";"L3_NORMALISEE"...
```

Un point virgule comme séparateurs, toutes les données enserrées dans des double quotes. Une information à connaître pour pouvoir configurer correctement ses scripts de manipulation de données. L'ouverture de l'extrait avec un tableur m'a aussi permis de constater que le fichier n'était pas encodé en utf-8, il y aura donc aussi ce point-là à prendre en compte.

### Etape 3 : trancher dans le lard

Un fichier csv de 8,6 giga, c'est lourd. C'est très lourd. Ce n'est pas du tout manipulable dans un tableur, par exemple (non, n'essayez pas).

J'ai découvert au fil du temps, et après trop de maltraitance de mon ordinateur, qu'à cette étape du projet il est capital :
- d'écrémer sérieusement et de ne conserver que les données sur lesquelles on va travailler,
- de faire cet écrémage avec des outils permissifs, pas raffiné pour deux sous, qui s'en foutent du typage, qui s'en tapent de l'encodage, etc. Pas même utiliser `DictReader` vu que les données sont formatées bizarrement, et qu'à la moindre erreur votre machine est susceptible d'imploser.

Et donc, un bon vieux script python de derrière les fagots fait le job :

```python
import csv
from collections import defaultdict

source_file = "source.csv"
dest_file   = "tech_grand_est_00.csv"


with open(source_file, 'rb') as csvfile:
    header = next(csvfile).strip("\n").split(";")
    print header
    print header[42]
    reader = csv.reader(csvfile, delimiter=';')
    ### Filtrage des codes APE
    results = filter(lambda row: row[42] == '5829A' or
                                 row[42] == '6201Z' or
                                 row[42] == '6202A' or
                                 row[42] == '6202B' or
                                 row[42] == '6203Z' or
                                 row[42] == '6209Z' or
                                 row[42] == '6311Z' or
                                 row[42] == '6312Z' or
                                 row[42] == '7311Z' or
                                 row[42] == '7410Z', reader)
    ### Ou bien filtrage par code ESS :
    # results = filter(lambda row: row[76] == 'O', reader)


with open(dest_file, 'wb') as outfile:
    writer = csv.writer(outfile)
    writer.writerow(header)
    for result in results:
        writer.writerow(result)
```

Une vérification rapide des données, en extrayant les premières lignes, ça mange pas de pain.

```bash
head -n 10 tech_grand_est_00.csv > tech_grand_est_00_fl.csv
```

### Etape 4 : encoding, continuer à réduire

Cette fois on peut passer à pandas, librairie python dédiée à la manipulation de données, pour y voir plus clair :  formater le header, passer l'encodage de `iso-8859-1` à `utf-8`....

```python
import pandas as pd
import datetime
import csv
from collections import defaultdict

source_file = "tech_grand_est_00.csv"
dest_file   = "tech_grand_est_01.csv"

df = pd.read_csv(source_file,
    sep=',' ,
    error_bad_lines=False,
    encoding='iso-8859-1',
    quoting=csv.QUOTE_NONE
)

print "Begining =============================================================="

df.columns = df.columns.str.replace('\"','')
df.columns = df.columns.str.replace("\r",'')

# Verification
print df.columns
print df[:10]
print len(df)

# Selection des departements qui intéressent
# type des departements pas clair.
df = df.loc[df['DEPET'].isin([
    88, 54, 55, 57, 67, 68, 70, 52, 10, 51, 8, 90,
    '88', '54', '55', '57', '67', '68', '70', '52', '10', '51', '8', '08', '90'
])]

df.to_csv(dest_file, sep=',', encoding='utf-8', index=False)

print "Ended ================================================================"
```

### Etape 5 : filtrage des colonnes, formattage du type des données

Le header est formaté correctement, on peut maintenant filtrer les colonnes en ne conservant que celles dont on va se servir.

A cette étape, j'en profite aussi pour réparer les formattages approximatifs fait par pandas. Voilà ce que c'est que d'utiliser des outils surpuissants sans avoir compulsé le mode d'emploi ; on se retrouve avec plein d'effets de bord pas du tout anticipé.

Par exemple le fait que dans pandas, les données sont typées (date, nombre, text...), et que de base tout ce qui est perçu comme nombre par pandas est typé comme un `float`. Et quand les codes postaux sont enregistrés sous le format `75011.0`, le géocodage est plus compliqué.

Réparons tout ça :

```python
import pandas as pd
import csv
from collections import defaultdict

source_file = "tech_grand_est_01.csv"
dest_file   = "tech_grand_est_02.csv"

df = pd.read_csv(source_file,
    sep=',' ,
    error_bad_lines=False,
    encoding='utf-8',
    quoting=csv.QUOTE_NONE,
    usecols=['SIREN', 'L1_NORMALISEE', 'L2_NORMALISEE',
    'NUMVOIE', 'INDREP', 'TYPVOIE', 'LIBVOIE', 'CODPOS',
    'DEPET', 'LIBREG', 'LIBCOM', 'TU',
    'APET700', 'LIBAPET', 'TEFET', 'LIBTEFET', 'EFETCENT', 'DCRET',
    'NJ', 'LIBNJ', 'ESS', 'DATEESS', 'CATEGORIE']
)

# replace 'NN' value with a numeric one (so as to cast afterwards)
df['TEFET'].replace('NN', '0',inplace=True)

### temporarely replace empty (NaN values) with 0, so as to cast afterwards
df['NUMVOIE'] = df['NUMVOIE'].fillna(0).astype(int)
df['DATEESS'] = df['DATEESS'].fillna(0).astype(int)
df['NJ'] = df['NJ'].fillna(0).astype(int)

df[['TU', 'CODPOS', 'DCRET', 'TEFET']] = df[['TU', 'CODPOS', 'DCRET', 'TEFET']].astype(int)

df['NJ'].replace('0', '',inplace=True)
df['DATEESS'].replace('0', '',inplace=True)

df.to_csv(dest_file, sep=',', encoding='utf-8', index=False)
```


### Etape 6 : s'occuper des dates

Là, je galèrais trop avec pandas, je suis donc repassée à du python basique.

```python

#!/usr/bin/env python
# -*- coding: utf-8 -*-

import csv
import re
import datetime

source_file = "tech_grand_est_02.csv"
dest_file   = "tech_grand_est_03.csv"

with open(source_file, 'rb') as csvfile, open(dest_file, 'wb') as outfile:
    reader = csv.DictReader(csvfile, delimiter=',')
    writer = csv.DictWriter(outfile, fieldnames=reader.fieldnames)

    for row in reader:
        row['DCRET'] = str(datetime.datetime.strptime(row['DCRET'], "%Y%m%d").date())
        if row['DATEESS'] in (None, ""):
            print 'skip'
        else:
            row['DATEESS'] = str(datetime.datetime.strptime(row['DATEESS'], "%Y%m%d").date())

        writer.writerow(row)
```

### Etape 6 bis : transformation des données

Pour créer une carte permettant de comparer la densité d'établissements dans le Grand Est par rapport au reste de la France, il me fallait extraire le nombre d'établissement de l'ESS par département. C'est le genre de manipulation pour lequel pandas est typiquement approprié.

```python
import pandas as pd
import numpy as np

from collections import defaultdict

source_file = "sirc-201707_L_M_ESS_cleaned.csv"
dest_file = "sirene_ESS_grouped_dept.csv"

df = pd.read_csv(source_file,
    sep=',' ,
    error_bad_lines=False,
    usecols=['SIREN','DEPET', 'LIBREG'],
    encoding='utf-8')

group_by_dpt = df.groupby(['DEPET', 'LIBREG']).count()
df_dept = pd.DataFrame(group_by_dpt)
df_dept.to_csv(dest_file, sep=',', encoding='utf-8')
```

### Etape 7 : géocoder

Pour afficher les établissements sur une carte, on a besoin de leurs coordonnées GPS, qui ne sont pas présentes dans les fichiers SIRENE.

Trouver un service en ligne de geocoding :  [adresse.data.gouv.fr](https://adresse.data.gouv.fr/csv) remplit nickel la mission.

Une fois récupéré le fichier csv, reste à faire le tri dans les colonnes qu'on veut conserver parmi celles qui ont été rajoutées dans le géocodage.

Les données sont propres, complètes, formatées. Prêtes à révéler leurs secrets (tadaaaaaaaaaaa !).

## Analyse et résultats

J'avais dans l'idée de présenter les résultats de mes expérimentations ESS sous forme de carte, mais vu le temps déjà passé à préparer les données, je n'avais aucune envie d'en plus avoir à apprendre une librairie de visualisation (à la [d3.js](https://d3js.org/)).

J'avais cru repérer que [carto.com](https://carto.com/), tout propriétaire qu'il soit, permettait d'avoir des résultats bien propres et avait un plan gratuit.

J'ai donc sauter dessus, et voici les résultats :

<iframe width="100%" height="520" frameborder="0" src="https://clairezed.carto.com/builder/c4a132ad-501d-49a9-a877-a9b5686a208a/embed" allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>

<iframe width="100%" height="520" frameborder="0" src="https://clairezed.carto.com/builder/b04bcbf6-8ee2-4d58-9911-c374bce6cc44/embed" allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>


Verdict : après un temps très raisonnable d'apprentissage, carto fait gagner beaucoup de temps, et très agréable à utiliser, et propose en quelques clics des modules qui permettent de filtrer les données très puissants.

N'hésitez pas à jouer un peu avec les petits modules "Région", "Ratio", "Activité"... pour comparer les données plus finement. Un vrai piège à temps.

Si vous voulez voir et manipuler les cartes en grand, directement sur carto.com :
- [Densité des établissements ESS France](https://clairezed.carto.com/builder/c4a132ad-501d-49a9-a877-a9b5686a208a/embed?state=%7B%22map%22%3A%7B%22ne%22%3A%5B39.926588421909436%2C-7.668457031250001%5D%2C%22sw%22%3A%5B52.26815737376817%2C12.106933593750002%5D%2C%22center%22%3A%5B46.44542749723387%2C2.2192382812500004%5D%2C%22zoom%22%3A6%7D%2C%22widgets%22%3A%7B%22815bb82d-1bb0-47e0-8dc7-f28747846f74%22%3A%7B%22normalized%22%3Atrue%7D%7D%7D)
- [Etablissements ESS en Lorraine](https://clairezed.carto.com/builder/b04bcbf6-8ee2-4d58-9911-c374bce6cc44/embed)

### OpenRefine

Pour la liste des établissements faisant du web, je ne voyais pas de plus-value à les mettre directement sur une carte. Je voulais en priorité jouer avec les données brutes, faire des recoupements facilement, etc.

J'ai donc préféré les importer dans [OpenRefine](http://openrefine.org/) ([version en ligne](https://my.datascientistworkbench.com/tools/openrefine)) pour estimer ce que je pouvais en tirer.

Résultat : pas grand chose de probant.

- Les Vosges sont le 6e établissement sur 12 étudiés pour le nombre de potentiels professionnels du web.
- J'aurais aimé, dans les Vosges, pouvoir faire le tri entre les auto (micro) entreprise et les autres société, mais je ne possède pas d'information sur la nature juridique de l'entreprise pour la grande majorité des établissements.
- Le type d'info peut être fourni par le nombre de salarié, mais exclu de fait les sociétés à plusieurs sociétaire sans salariés.

Bref, ce sera à affiner, et j'essaierai de croiser avec d'autres données une prochaine fois.

## Conclusions

Quelques éléments de conclusion après deux jours dans le monde des données :

- récupérer des sources et apprendre à les connaître (quelle colonne correspond à quoi ? Quelle donnée peut m'intéresser ? Est-elle renseignée systématiquement ?) demande beaucoup de temps. Et encore, je n'étais ici que sur des données ultra balisées (SIRENE).

- Apprendre de nouveaux outils, c'est toujours long (ici : pandas + carto).

- Récupérer des données dont les champs sont mal formatés ou pas formaté avec consistance complique la tâche. Dans le répertoire SIRENE, certains champs booléens (oui / non) sont parfois représentés par des chiffres (1 / 0), d'autres fois par des lettres (O / N)... Quand on utilise en plus un outil de traitement avec un système de typage fort, ça peut très vite devenir le bazar.

- Je reste toujours sacrément plus à l'aise sur des outils visuels, mais apprendre un peu de python est + qu'utile pour les gros traitements impossibles à faire par d'autres moyens (fichiers de plusieurs gigabytes...)

- C'est compliqué de manipuler des fichiers "à l'aveugle" (fichiers trop gros), et le risque d'exclure sans le savoir des données qui pourraient être intéressantes est réel. Je sais par exemple que pandas a exclu d'office certaines lignes du CSV qui ne correpondait pas à je ne sais quelle norme (non détectée en faisant des tests sur un extrait plus court du fichier). Et j'ai donc été surprise de ne pas retrouver dans mon fichier final des entreprises du web une société d'Epinal que j'avais en tête, sortie à je ne sais quel moment de mes manipulations. Réussir à prendre en compte absolument toutes les données est un travail de titan.

- J'ai découvert sur le tard des outils qui rendent inutiles la plus grosse part des manipulations que j'aie eu à faire, super. L'[API Sirene](https://data.opendatasoft.com/explore/dataset/sirene%40public/api/) proposée par OpenDataSoft permet de faire un grand nombre de recherche sur le répertoire SIRENE, et d'exporter les résultats. En plus les adresses sont déjà géocodées. Heureusement, tous les filtres (notamment code ESS) ne sont pas présnets, ce qui m'a éviter de me dire à 100% que mon travail avait été inutile.

- enfin, un lien que je voulais garder sous la main pour plus tard : [Useful Pandas Snippets](https://gist.github.com/bsweger/e5817488d161f37dcbd2)

## Edit

Suite à la publication de l'article, [Thomas](@oncletom@framapiaf.org), qui est bien acoquiné avec data.gouv.fr, me signale d'autres ressources qui m'avaient échappées :
- En bas de la [page de téléchargement](https://www.data.gouv.fr/fr/datasets/base-sirene-des-entreprises-et-de-leurs-etablissements-siren-siret/) du répertoire, il y a aussi à disposition des "Ressources communautaires" (dont le répertoire géocodé) et des cas de réutilisations.
- [Sirene as API](https://github.com/sgmap/sirene_as_api) : travaux en cours pour fournir une API au répertoire SIRENE, en Ruby en Rails et Vue.js (yeah!)
