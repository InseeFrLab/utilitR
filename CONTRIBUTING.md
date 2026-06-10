# Guide pour contribuer à la documentation `utilitR`

## :one: Introduction

Il est possible de contribuer au projet `utilitR` de différentes manières, détaillées dans ce document. Les contributions peuvent prendre différentes formes, d'un avis argumenté suite à une relecture à des propositions de modification en passant par des propositions d'intégrations de nouveaux éléments dans le livre ou le site. 

> [!TIP]
>**Il n'est pas nécessaire d'être un expert en `R` pour contribuer au projet `utilitR`.** En revanche, il est nécessaire de s'inscrire dans le fonctionnement
des contributeurs actuels, fonctionnement qui est orchestré autour de `Github` et de ses différents outils.
Il est possible d'en acquérir très rapidement les bases à partir de [cette formation](https://inseefrlab.github.io/formation-bonnes-pratiques-git-R/) ou à partir d'échanges avec les contributeurs actuels.

Un environnement prêt à l'emploi pour l'exécution des scripts est disponible sur le `SSPCloud`. Il est présenté dans une section dédiée.


Pour les relecteurs quelques notions de l'environnement `Github` suffisent
(ou peuvent s'acquérir facilement) pour apporter sa pierre à l'édifice.

Les mainteneurs et développeurs du projet `utilitR` sont en effet disponibles
pour aider tous les personnes qui souhaitent contribuer, ce qui signifie
qu'il est possible d'interagir avec eux pour être guidé en cas de difficultés.
Toutefois, **le respect des règles de contribution détaillées ci-dessous est essentiel pour l'efficacité du travail collectif et pour assurer la qualité de cette documentation.**


## :two: Comment proposer des modifications d'une fiche? 

[:arrow_up: Retour à l'introduction](#one-introduction)

Pré-requis: avoir un compte Github.

Pour ce type de modifications, il est demandé d'utiliser directement
l'outil de suggestions de changements de `Github`.
Le livre déployé sur https://book.utilitr.org comprend un bouton `Edit` qui
permet de proposer, automatiquement, des modifications via l'interface de 
`Github`. 

## :three: Comment participer aux discussions collectives?

[:arrow_up: Retour à l'introduction](#one-introduction)

L'équipe du projet `utilitR` dispose d'un espace de discussion collective
sur les problèmes techniques et les développements futurs du projet.
Cet espace de discussion est stocké sur le dépôt `Github` du projet et est
structuré sous forme d'_issues_.

Une *issue* est un fil de discussion permettant aux contributeurs du projet (mais aussi aux personnes extérieures) d'échanger sur un sujet précis (défini par le titre de l'*issue*). Vous
pouvez consulter la liste des *issues* ouvertes
en suivant [ce lien](https://github.com/InseeFrLab/utilitR/issues).


## :four: Comment effectuer la relecture d'une fiche?

[:arrow_up: Retour à l'introduction](#one-introduction)

Un relecteur peut proposer de relire une ou plusieurs fiches de son choix,
ou suivre les indications des contributeurs du projet.

> [!WARNING]  
> **Attention: relire une fiche ne consiste pas à la remanier intégralement.**
La relecture doit porter sur les éléments suivants: clarté de
l'exposé, cohérence de l'organisation des paragraphes, correction de
l'expression, pertinence des conseils, reproductibilité des exemples.
Autrement dit, le relecteur a pour rôle de vérifier que la fiche est
compréhensible par un utilisateur standard. En revanche, la relecture ne porte
pas sur les recommandations formulées dans la fiche, ni sur
son organisation globale.

Le lieu idéal de retour de la part d'un relecteur ou d'une relectrice dépend du type de modification envisagée :

* Proposer des corrections mineures (faute d'orthographes, formulations peu claires) : il est recommandé de passer directement par l'interface de Github ; 
* Pour des problèmes plus importants, il est possible d'ouvrir une *issue*

## :five: Comment ajouter une nouvelle fiche à la documentation? 

[:arrow_up: Retour à l'introduction](#one-introduction)

> [!CAUTION]
> Ajouter une nouvelle fiche thématique à la documentation représente un
travail conséquent qui requiert l'approbation de la
majorité des contributeurs du projet.

La première étape consiste à __ouvrir une *issue*__ dans le
dépôt `Github`. 

Une fois que l'équipe de contributeurs est d'accord sur l'objet de la fiche et les grandes lignes de son contenu, la fiche peut être rédigée en suivant la procédure décrite ci-dessous.

> [!CAUTION]
> Ne pas travailler sur la branche `main` de son fork. Celle-ci
servira à mettre à jour le fork pour intégrer les dernières mises à jour
de la documentation `utilitR`.

Plutôt que d'utiliser un environnement en local dont la configuration peut différer de manière parfois significative avec l'environnement canonique qui sert à générer la documentation `utilitR` sous Github, il est recommandé d'utiliser le service RStudio du `SSPCloud`.

#### Lancer le service RStudio configuré sur le `SSPCloud`

Pour contribuer à `utilitR`, il est possible de créer un service RStudio entièrement paramétré, de la manière suivante :

1. Mettre de côté l'URL de votre *fork* du projet `utilitR` (celui terminant par `.git`)
2. Copier-coller le lien préconfiguré pour ouvrir l'interface de configuration de votre service
3. Dans l'onglet `Git`, coller l'URL de votre dépôt `Github` 
4. Lancer la création du service, attendre puis ouvrir lorsque celui-ci est prêt. Vous devriez avoir un RStudio prêt à l'emploi.
5. Faire des modifications et tester le bon fonctionnement avec la commande `quarto preview --port 5000 --host 0.0.0.0`

> [!NOTE]  
> S'il est nécessaire d'utiliser un nouveau *package* R, par exemple `toto`, il faut l'installer via la commande `rv add toto` en ligne de commande

### :one: Forker le dépôt `utilitR`

Seuls les mainteneurs du dépôt `utilitR` ont les droits d'écriture sur le dépôt
officiel de la documentation. Pour pouvoir proposer de nouvelles fiches, il faut passer par un dépôt intermédiaire sur lequel vous avez les droits d'écritures: un *fork*.


### :two: Lancer un service du SSPCloud

Un service préconfiguré presque prêt à l'emploi est disponible en cliquant sur [ce lien](https://datalab.sspcloud.fr/launcher/ide/rstudio?name=rstudio%20utilitr&version=2.4.6&s3=default&init.personalInit=%C2%ABhttps%3A%2F%2Fraw.githubusercontent.com%2FInseeFrLab%2FutilitR%2Frefs%2Fheads%2Fmain%2Finit_utilitr.sh%C2%BB&kubernetes.role=%C2%ABadmin%C2%BB&git.repository=%C2%ABhttps%3A%2F%2Fgithub.com%2Finseefrlab%2Futilitr.git%C2%BB&networking.user.enabled=true&autoLaunch=false)

```
https://datalab.sspcloud.fr/launcher/ide/rstudio?name=rstudio%20utilitr&version=2.4.6&s3=default&init.personalInit=%C2%ABhttps%3A%2F%2Fraw.githubusercontent.com%2FInseeFrLab%2FutilitR%2Frefs%2Fheads%2Fmain%2Finit_utilitr.sh%C2%BB&kubernetes.role=%C2%ABadmin%C2%BB&git.repository=%C2%ABhttps%3A%2F%2Fgithub.com%2Finseefrlab%2Futilitr.git%C2%BB&networking.user.enabled=true&autoLaunch=false
```

Ne pas lancer tout de suite. Dans l'onglet `Git`, coller l'URL de votre dépôt. Après avoir fait cela, vous pouvez lancer. 

### :three: Rédiger sa fiche dans une branche dédiée

Il est recommandé d'effectuer ses modifications depuis une branche différente de `main`. Avant de rédiger, il est recommandé de lancer en arrière plan une première compilation de la documentation. 2 manières de faire:

* Via le bouton RStudio `Render`
* En passant par la ligne de commande en lançant `quarto preview --port 5000 --host 0.0.0.0.`

Pendant ce temps, vous pouvez commencer à tester vos modifications: la prévisualisation se raffraîchira régulièrement.

