# Comment contribuer au `cookbookInsee`

L'objet de ce document est de présenter les différentes
manières de participer au `cookbook`. Il s'agit d'une adaptation du code des
contributeurs proposé par l'équipe du `tidyverse`.


### Retirer des coquilles

Pour les erreurs grammaticales, orthographiques ou les coquilles,
il est possible de passer directement par l'interface graphique de `gitlab`.
Pour cela, vous pouvez suivre
[cette démarche](https://docs.gitlab.com/ee/user/discussions/#suggest-changes).

### Prérequis

Avant de proposer une `merge request`, il est nécessaire d'ouvrir une *issue*
et s'assurer que l'équipe de mainteneurs du projet considère qu'il s'agit
d'un chemin à suivre. Cela permet d'interagir avec eux et ainsi mieux
définir le chemin à suivre pour développer le `cookbook`. Si l'objet
de la modification est un `bug` detecté, ajouter le label `bug` et
essayer d'illustrer avec
un [exemple reproductible minimal](https://www.tidyverse.org/help/#reprex).


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