---
layout: post
title: Data ess grand est
category: good_job
tags: [et moi]

---



<!--more-->

## Trouver les données

Les chiffres :
[www.data.gouv.fr](https://www.data.gouv.fr/en/datasets/base-sirene-des-entreprises-et-de-leurs-etablissements-siren-siret/)
Prendre les fichiers "stock" de début de mois (et non les ficheirs "mise à jour quotidienne").

Ok, le fichier initial fait 8,6 GB.

Les données géographiques :


## Formater les données

### Comprendre la nomenclature

Comprendre la nomenclature SIRET : [pdf explicatif](https://www.sirene.fr/static-resources/doc/dessin_L2_description_complete.pdf?version=1.14)

J'apprends qu'il y a logiquement une [variable ESS](https://www.sirene.fr/sirene/public/variable/syr-ess)

Voir la [liste des variables sirene](https://www.sirene.fr/sirene/public/static/liste-variables)

Je vais donc commencer par chercher les entreprises ayant 'O' dans la case 'ESS'.

### L'écrémage

Script python pour extraire les organisations signalées comme ESS :

Avec le script dans le même dossier que le csv : `python sirene_ess_extraction.py `

```python
import csv

with open('sirc-201707_L_M.csv', 'rb') as csvfile:
    # handle header line, save it for writing to output file
    header = next(csvfile).strip("\n").split(";")
    print header[76]
    reader = csv.reader(csvfile, delimiter=';')
    results = filter(lambda row: row[76] == 'O', reader)
    # print results
    # print("Nb de lignes final :", len(list(results)))


with open('output.csv', 'wb') as outfile:
    writer = csv.writer(outfile)
    writer.writerow(header)
    for result in results:
        writer.writerow(result)
```

On passe à 640 MB, c'est mieux. Mais c'est quand même plus d'1 millions de lignes, pas encore possible de l'ouvrir.

J'ai des problèmes d'encodage que je perds trop de temps à essayer de régler (apparement, ce n'est pas du UTF-8 et les accents me posent problème). A défaut d'extraire toutes les sociétés d'Iles de France, j'essaye d'extraire toutes celles à Paris même, pour voir. Mais ça n'enlève que 40 MB sur les 640. Pas probant.

Il faudrait donc que je trouve un moyen de faire mes group_by directement en ligne de commande. Je cherche, et tombe sur [pandas](http://pandas.pydata.org)

Pb rencontrés de configuration de base (le bon séparateur, encoding dégueulasse, etc).

A un moment, me suis rendue compte que des exports successifs fait à l'arrache avaient un peu salopé mes données. Les noms de mes colonnes étaient par exemple passés de 'SIREN' à '"""SIREN"""', ce qui était un peu pénible pour manipuler les données à partir de ces noms. Bref. J'ai pris le temps de mener une opération de nettoyage.

```python
import pandas as pd

from collections import defaultdict

source_file = "sirc-201707_L_M_ESS.csv"
dest_file = "sirc-201707_L_M_ESS_cleaned.csv"

df = pd.read_csv(source_file, sep=',' ,error_bad_lines=False, encoding='iso-8859-1')
df.columns = df.columns.str.replace('\"','') # enlève les extra '"'
df.columns = df.columns.str.replace("\r",'') # enlève des sauts de ligne à la con

# Ce que j'aurais dû faire aussi, pour éviter les 'NaN' dans les colonnes vides : df = df.fillna('')

# Les print de vérif rapide
print df.columns
print df[:15]
df.to_csv(dest_file, sep=',', encoding='utf-8', index=False)

print "\n===========VERIF ==============\n"
df_verif = pd.read_csv(dest_file)
print df_verif[:10]
```

Puis grouper les colonnes avec un script ressemblant à ça :

```python
import pandas as pd
import numpy as np
np.set_printoptions(threshold=np.nan)

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

Après un sombre problème de doublons sur approximativement les 2/3 de mes données (deux lignes pour le département 88, le département 63...), et après avoir passer bien trop de temps sans succès à savoir d'où ça pouvait venir (problème de formatage ou de typage des données ?), j'ai aggloméré à la mano sous excel les doubles données. Zut à la fin.

Joindre les données sur cartodb (base code département ?)



## Pour la suite

Les données que je recherche :
- structures ESS -> écrémage python ?
- structures tech
- agences de com Vosges

Nombre de structures ESS par département en France.

Evolution par région par année ?

## Détail ESS Lorraine

Je poursuis dans ma lancée, avec une étude un peu plus détaillée des établissements ESS en Lorraine.
Pour commencer, détaillons la nomenclature du fichier SIRENE pour ne conserver que les données qui nous intéressent, constatons que la nomenclature est assez mal fichue et pas du tout pratique, et refaisons une compilation à la mano (dispo [ici](https://gist.github.com/clairezed/cd69498f75a3e2768eef54e7af3c7536)).

Après ça, extraire les colonnes souhaitées, pour les départements désirés :

```python
import pandas as pd
from collections import defaultdict

source_file = "sirc-201707_L_M_ESS.csv"
dest_file = "sirc-201707_L_M_ESS_Lorraine.csv"

df = pd.read_csv(source_file,
    sep=',' ,
    error_bad_lines=False,
    usecols=['SIREN','NIC', 'L1_NORMALISEE', 'L2_NORMALISEE',
    'NUMVOIE', 'INDREP', 'TYPVOIE', 'LIBVOIE', 'CODPOS',
    'DEPET', 'LIBREG', 'LIBCOM', 'TU',
    'APET700', 'LIBAPET', 'TEFET', 'LIBTEFET', 'EFETCENT', 'DCRET',
    'NJ', 'LIBNJ', 'ESS', 'DATEESS', 'CATEGORIE'],
    encoding='utf-8'
)


# Selecting Lorraine departements
df = df.loc[df['DEPET'].isin([88, 54, 55, 57, '88', '54', '55', '57'])]

# Etablissements avec au moins 1 salarié
# df = df.loc[df['TEFET'].isin([88, 54, 55, 57, '88', '54', '55', '57'])]
# Verif
print df[:15]

df.to_csv(dest_file, sep=',', encoding='utf-8')
```

J'ai également passé une bonne demi-heure a essayer d'expurger les établissements sans salariés (pour éviter les asso exclusivement bénévoles, et réduire d'autant les données à manipuler).

J'ai miraculeusement réussi une fois, avec une formule du genre `df = df.loc[~df['TEFET'].isin(['0', 'NN', 0])]`, à partir du fichier issu de la manipulation précédente. J'ai essayé de tout filtrer d'un coup sans succès, pandas ne reconnaissant pas mes filtres de salariés, et me semble-t-il, interprétant les '0' dans la colonne comme étant le signe qu'il fallait considérer la colonne comme une colonne de booléens. Muf.


Et je me retrouve donc avec...
```python
len(df)
=>5888
```
un peu moins de 6000 établissements. Parfait, on va pouvoir commencer à analyser.

### Rajouter des données pour pouvoir afficher

D'abord, gécoding.

J'ai testé un ou deux services, c'est l'un de ceux de [data.gouv.fr]( ) qui m'a rendu service. Mais d'abord, encore une fois, il fallait régler un problème de typage. Pandas cast automatiquement tout ce qui lui semble numérique comme étant un `float`, et des numéros de rue comme "6.0" et des codes postaux comme "88140.0" rendent le service de géocoding chèvre.

Donc zou, on repasse dans la moulinette.

```python
## impossible de caster des cellules vides, considérées comme NaN par pandas, en integer.
## L'astuce pour moi a donc été de remplacer les vides par des "0" puis de caster.
df['NUMVOIE'] = df['NUMVOIE'].fillna(0).astype(int)
df[['TU', 'CODPOS', 'DCRET']] = df[['TU', 'CODPOS', 'DCRET']].astype(int)
```


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
