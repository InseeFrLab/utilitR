# Comment tester la reproductibilité de la documentation ? 

## :one: Environnement de travail

Plusieurs solutions sont possibles pour disposer de l'environnement de travail nécessaire à la compilation de cette documentation : 

- pour une installation sur un poste, voir la procédure d'[installation des _packages_](#installation-des-packages). _Cette solution ne garantit pas la reproductibilité._

- [l'utilisation d'un container](#utilisation-dun-container). _Cette solution vous offre des garanties élevées de reproductibilité._

## :two: Installation des _packages_

Les _packages_ nécessaires sont déclarés dans le fichier [DESCRIPTION](DESCRIPTION).  
Vous pouvez les installer en exécutant : 

```r
install.packages("remotes")
remotes::install_deps(dependencies = TRUE)
```

