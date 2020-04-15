# Scripts R utilitaires

## Exporter la liste des packages LaTeX installés dans TinyTeX -- `tinytex_ls_pkgs.R`

Le script `tinytex_ls_pkgs.R` exporte la liste des packages LaTeX installés dans le fichier `_latex_requirements.txt`.

### Usage

Depuis R :

```r
source(file.path(rprojroot::find_rstudio_root_file(), "_tools/tinytex_ls_pkgs.R"))
```

Depuis un terminal : 

```r
Rscript _tools/tinytex_ls_pkgs.R
```

## Installer la liste des packages LaTeX requis

Le script `install_tinytex_pkgs.R` installe la liste des packages LaTeX déclarés dans le fichier `_latex_requirements.txt`.

### Usage

Depuis R :

```r
source(file.path(rprojroot::find_rstudio_root_file(), "_tools/install_tinytex_pkgs.R"))
```

Depuis un terminal : 

```r
Rscript _tools/install_tinytex_pkgs.R
```

