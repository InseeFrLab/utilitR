# Scripts R utilitaires

## Exporter la liste des packages LaTeX installés

Le script `export_tinytex_pkgs.R` exporte la liste des packages LaTeX installés dans le fichier `_latex_requirements.txt`.

### Usage

#### Depuis R

```r
source(file.path(rprojroot::find_rstudio_root_file(), "_tools/export_tinytex_pkgs.R"))
```

#### Depuis un terminal 

```bash
Rscript _tools/export_tinytex_pkgs.R
```

ou

```bash
_tools/export_tinytex_pkgs.R
```
