ARG BASE_IMAGE=rocker/geospatial:latest

# Use a multi-stage build to install packages
# First stage: install packages
FROM $BASE_IMAGE AS install_packages
# LaTeX packages 
COPY ./_latex_requirements.txt /tmp/build_image/
RUN tlmgr install `cat /tmp/build_image/_latex_requirements.txt | tr '\r\n' ' '`
# R packages 
COPY ./DESCRIPTION /tmp/build_image/
RUN Rscript -e "remotes::install_deps('/tmp/build_image', dependencies = TRUE, upgrade = FALSE)"

# Second stage: use the installed packages directories
FROM $BASE_IMAGE
COPY --from=install_packages /opt/texlive /opt/texlive
COPY --from=install_packages /usr/local/texlive /usr/local/texlive
COPY --from=install_packages /usr/local/lib/R/site-library /usr/local/lib/R/site-library
# Change right permissions (see https://github.com/rocker-org/rocker-versioned/issues/104)
RUN  chown -R root:staff /opt/texlive \
  && chown -R root:staff /usr/local/texlive \
  && chmod -R 777 /opt/texlive \
  && chmod -R 777 /usr/local/texlive
