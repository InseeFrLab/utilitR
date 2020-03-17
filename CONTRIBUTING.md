# Comment contribuer au `cookbookInsee`

L'objet de ce document est de présenter les différentes
manières de participer au `cookbook`. Il s'agit d'une adaptation du code des
contributeurs proposé par l'équipe du `tidyverse`.

## Comment écrire une fiche thématique pour la documentation `R`

* Signaler dans l'*issue* #6 sur quel sujet vous voulez proposer une fiche (toutes suggestions bienvenues);
* Une fois que l'équipe de contributeurs est d'accord sur l'objet de la fiche:
    - créer une branche dont le nom reflète l'objet de la fiche (exemple: fiche_graphiques); c'est dans cette branche du dépôt que la fiche va être rédigée;
     - créer une *issue* dont le nom reflète l'objet de la fiche (exemple: "discussion fiche graphiques"): cette *issue* va servir de fil de discussion sur la fiche.
* Rédiger la fiche en `Rmarkdown` à partir du modèle de fiche (03_Fiches_thematiques/Modele_de_fiche.Rmd);
* Quand une première version de la fiche est prête:
    - vérifier que le code est bien fonctionnel (c'est-à-dire que la branche compile bien);
    - faire un *merge request* vers la branche master du dépôt, avec les options `squash commits` et `WIP` (Work In Progress);
* Préciser quels sont les relecteurs de la fiche;
* Une fois que la fiche est acceptée, l'un des mainteneurs accepte le *merge request*.

## Comment rédiger une fiche thématique

C'est ici que les obsessionnels de la mise en page peuvent se lâcher. Quelques idées:

* Sur la rédaction elle-même:
    - Rédiger la fiche en `Rmarkdown` à partir du modèle de fiche (03_Fiches_thematiques/Modele_de_fiche.Rmd);
    - Utiliser systématiquement la syntaxe `package::function()` quand on parle d'une fonction;
    - mettre *package* en italique;
* Sur le fond:
    - **Bien tester tous les exemples**;
    - Utiliser au maximum des *datasets* disponibles par défaut dans `R` pour les exemples (`iris`, `nycflights13`, etc.);
    - Pour présenter l'utilisation d'une fonction:
        + commencer par le comportement par défaut (avec le minimum d'arguments);
        + présenter les principales options, avec un ou deux exemples.



### Retirer des coquilles

Pour les erreurs grammaticales, orthographiques ou les coquilles,
il est possible de passer directement par l'interface graphique de `gitlab`.
Pour cela, vous pouvez suivre
[cette démarche](https://docs.gitlab.com/ee/user/discussions/#suggest-changes).



### Processus de `merge request`

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