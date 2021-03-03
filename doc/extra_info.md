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

## :three: Utilisation d'un container

L'environnement de travail utilisé pour la compilation de la documentation est disponible sous la forme d'une image docker :

```
docker.io/inseefrlab/utilitr:latest
```

Cette image comprend toutes les dépendances système ainsi que les packages R nécessaires à la compilation du livre.  
Il comprend également RStudio : voir la procédure ci-après pour exécuter cet environnement.

### Container temporaire

_Cette solution vous sera utile si vous souhaitez apporter une modification ponctuelle au projet._

### Utilisation en ligne avec Binder

:warning: Cette solution ne fonctionne plus à l'heure actuelle. Elle sera remise en état dès que possible

Afin d'assurer une parfaite reproductibilité, un environnement de travail est disponible en ligne en cliquant sur ce bouton 
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gl/linogaliana%2FdocumentationR/binder?urlpath=rstudio).

Vous arrivez sur un environnement de travail RStudio avec tous les packages déjà installés. Cet environnement utilise le service [Binder](https://mybinder.org) : il peut être indisponible ponctuellement.

### Utilisation de docker sur un poste de travail

Si docker est installé sur votre machine, vous pouvez exécuter : 

```bash
docker run --rm -p 8787:8787 -e PASSWORD=monpassword docker.io/inseefrlab/utilitr:latest
```

Vous pouvez remplacer `monpassword` par le mot de passe de votre choix.

Un serveur RStudio est alors disponible à l'url <http://127.0.0.1:8787>.  
Pour vous connecter sur ce serveur, vous devez utiliser :

- nom d'utilisateur : `rstudio`
- mot de passe : le mot de passe choisi ci-dessus (`monpassword`) dans l'exemple.

Une fois connecté à RStudio, vous devez ensuite cloner le projet <https://github.com/InseeFrLab/utilitR.git>.  
Si vous opérez des modifications, n'oubliez pas de transmettre vos modifications à l'aide de `git` grâce à un `push`. En effet, l'utilisation de l'option `--rm` détruira automatiquement votre container et son système de fichiers.

### Container permanent

Il vous est possible de créer un container permanent (attention, celui peut-être obsolète si de nouvelles dépendances sont ajoutées) ce qui vous permettra de ne pas perdre vos fichiers.

Créez un container appelé `mon_container` (vous pouvez changer ce nom) en mode détaché :

```bash
docker run --name mon_container -d -p 8787:8787 -e PASSWORD=monpassword docker.io/inseefrlab/utilitr:latest
```

Vous pouvez aussi attacher un volume à ce container grâce à l'option `-v` (sous linux, n'oubliez pas de rajouter l'option `-e USERID=$UID`). Par exemple, pour ajouter vos clés `ssh` : 

```bash
docker run --name mon_container -d -p 8787:8787 -v $HOME/.ssh:/home/rstudio/.ssh -e USERID=$UID -e PASSWORD=monpassword docker.io/inseefrlab/utilitr:latest
```

Une fois ce container créé et lancé, vous pouvez vous connecter sur le serveur RStudio disponible à l'adresse <http://127.0.0.1:8787>. Pour se connecter, le nom d'utilisateur est `rstudio` et le mot de passe `monpassword`.

Dans RStudio, vous pouvez ensuite cloner le projet <https://github.com/InseeFrLab/utilitR.git> et travailler. N'oubliez pas de sauvegarder vos modifications.

Une fois que vous avez fini de travailler :

- dans RStudio, cliquez sur l'icone rouge située en haut à droite _"Quit the current R session"_.
- dans votre terminal, exécutez : 
  ```bash
  docker stop mon_container
  ```

Pour relancer plus tard votre serveur RStudio et retrouver vos fichiers, vous pouvez redémarrer votre container : 

```bash
docker start mon_container
```
