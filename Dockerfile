ARG BASE_IMAGE=rocker/geospatial:3.6.1
# Use a multi-stage build to install packages

# First stage: install packages
# LaTeX packages 
FROM $BASE_IMAGE AS install_packages
COPY ./_latex_requirements.txt /tmp/build_image/
RUN tlmgr install `cat /tmp/build_image/_latex_requirements.txt | tr '\r\n' ' '`
# R packages 
COPY ./DESCRIPTION /tmp/build_image/
RUN Rscript -e "remotes::install_deps('/tmp/build_image', dependencies = TRUE, upgrade = FALSE)"

# Second stage: use the installed packages directory
FROM $BASE_IMAGE
COPY --from=install_packages /opt/TinyTeX /opt/TinyTeX
COPY --from=install_packages /usr/local/lib/R/site-library /usr/local/lib/R/site-library
# Change right permissions (see https://github.com/rocker-org/rocker-versioned/issues/104)
RUN  chown -R root:staff /opt/TinyTeX \
  && chmod -R g+w /opt/TinyTeX \
  && chmod -R g+wx /opt/TinyTeX/bin
