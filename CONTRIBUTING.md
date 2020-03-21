# Guide pour contribuer au `cookbookInsee` :cop:

:closed_book:
:police_car: :cop: :oncoming_police_car:
:books: :guardsman: :nerd: 

L'objet de ce document est de présenter les différentes
manières de participer au `cookbook`. Il s'agit d'une adaptation du code des
contributeurs proposé par l'équipe du `tidyverse`.

## Comment ajouter une fiche thématique à la documentation `R` :thumbsup:

Dans un premier temps, dans le dépôt `gitlab`:

* Signaler dans l'*issue* `#6` sur quel sujet vous voulez proposer une fiche (toutes suggestions bienvenues :nerd: );
* Une fois que l'équipe de contributeurs est d'accord sur l'objet de la fiche :happy: :
    - créer une branche dont le nom reflète l'objet de la fiche (exemple: `fiche_graphiques`); c'est dans cette branche du dépôt que la fiche va être rédigée :scroll: :pencil2:);
    - créer une *issue* dont le nom reflète l'objet de la fiche (exemple: *"Discussion fiche graphiques"*): cette *issue* va servir de fil de discussion sur la fiche :loudspeaker:. Ne pas oublier d'ajouter des *labels* adéquats dans l'*issue*.

Ensuite, avec `R`: 

* Rédiger la fiche en `Rmarkdown` à partir du modèle de fiche (03_Fiches_thematiques/Modele_de_fiche.Rmd) :black_nib: ;
* Quand une première version de la fiche est prête:
    - vérifier que le code est bien fonctionnel (c'est-à-dire que la branche compile bien :heavy_check_mark:);
    - faire un *merge request* vers la branche master du dépôt, avec les options `squash commits` et `WIP` (Work In Progress);
* Préciser quels sont les relecteurs de la fiche :nerd:;
* Une discussion s'engage dans la MR sur les améliorations/corrections à apporter à la fiche;
* **La validation d'une fiche est une décision collective**. La règle approximative est qu'une fiche est intégrée à la documentation si quatre ou cinq contributeurs considèrent qu'elle est acceptable en l'état;
* Une fois que la fiche est acceptée, l'un des mainteneurs accepte la *merge request*.

:tada: :confetti_ball:


## Comment rédiger une fiche thématique :grinning:

La fiche doit être parfaitement reproductible et respecter quelques contraintes
formelles :police_car:. Pour cela, quelques règles sont ici évoquées:

### Contraintes formelles

* Rédiger la fiche en `Rmarkdown` à partir du modèle de fiche (`03_Fiches_thematiques/Modele_de_fiche.Rmd`);
* Les extensions des images doivent être en minuscules. Cela veut dire qu'il faut éviter l'extension
`.PNG` que `Windows` génère parfois (notamment via l'outil capture). Si un 
ou plusieurs fichiers `.PNG` ont été générés,
vous pouvez utiliser ce [*snippet* de code `R`](https://gitlab.com/linogaliana/documentationR/snippets/1954584) pour le convertir en 
`.png`.

### Bonnes pratiques de codage en `R`

Dans la mesure où les exemple de code `R` ont vocation à être réutilisés directement par les agents de l'Insee, il est demandé aux contributeurs de suivre le guide des bonnes pratiques (deuxième partie de la documentation). Le principe général est que la documentation doit être reproductible. Nous attirons particulièrement votre attention sur la gestion des dépendances.

#### Assurer la qualité du code

* **Bien tester tous les exemples**;
* Utiliser uniquement des *datasets* disponibles dans `R` pour les exemples (`iris`, `nycflights13`, etc.);
* Pour présenter l'utilisation d'une fonction:
        + commencer par le comportement par défaut (avec le minimum d'arguments);
        + présenter les principales options, avec un ou deux exemples;
* Ne pas faire de *merge request* sur un code qui n'est pas entièrement fonctionnel.

#### Gérer et savoir présenter les dépendances

Voici comment on présente l'utilisation d'un `package` :cop: :

* Rappeler systématiquement que le *package* est chargé avec `library(package)` (plutôt que `package::function()`);
* Rappeler systématiquement que le chargement de tous les *packages* doit se faire **au début** du code, et non au milieu du code;
* **Les *packages* utilisés par une fiche doivent être listés dans le fichier `DESCRIPTION`.** Vous
n'avez pas besoin de le modifier manuellement, vous pouvez utiliser une fonction du
package `usethis` pour cela: `r usethis::use_package("monpackage")`. La dépendance sera alors automatiquement ajoutée au fichier `DESCRIPTION`, au niveau de la 
liste des `Imports`. :tada: 

#### Gérer les jeux de données

Pour les jeux de données utilisés dans les exemples, on précise systématiquement le *package* d'origine. Par exemple on écrit `data("World", package = "sf")` pour utiliser la table `World` du *package* `sf`. Une exception à cette règle concerne les jeux de données des *packages* présents dans la distribution de 
base (`iris`, `mtcars`, etc. ). Pour ceux-là, on pourra simplifier l'appel avec la commande `data("iris")`.

## Retirer des coquilles

Pour les erreurs grammaticales, orthographiques ou les coquilles (:thumbsdown:),
il est possible de passer directement par l'interface graphique de `gitlab` :smile:.
Pour cela, vous pouvez suivre
[cette démarche](https://docs.gitlab.com/ee/user/discussions/#suggest-changes).




<!-------------- tidyverse style
*  We recommend that you create a Git branch for each pull request (PR).  
*  Look at the Travis and AppVeyor build status before and after making changes.
The `README` should contain badges for any continuous integration services used
by the package.  
*  New code should follow the tidyverse [style guide](https://style.tidyverse.org).
You can use the [styler](https://CRAN.R-project.org/package=styler) package to
apply these styles, but please don't restyle code that has nothing to do with 
your PR.  
*  We use [roxygen2](https://cran.r-project.org/package=roxygen2), with
[Markdown syntax](https://cran.r-project.org/web/packages/roxygen2/vignettes/markdown.html), 
for documentation.  
*  We use [testthat](https://cran.r-project.org/package=testthat). Contributions
with test cases included are easier to accept.  
*  For user-facing changes, add a bullet to the top of `NEWS.md` below the
current development version header describing the changes made followed by your
GitHub username, and links to relevant issue(s)/PR(s).

### Code of Conduct 

Please note that the cookbookInsee project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this
project you agree to abide by its terms.

### See tidyverse [development contributing guide](https://rstd.io/tidy-contrib)
for further details.
--------------->