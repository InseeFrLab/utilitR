ARG BASE_IMAGE=rocker/geospatial:3.6.1
# Use a multi-stage build to install packages

# First step: copy the DESCRIPTION file and install packages 
FROM $BASE_IMAGE AS install_packages
COPY ./DESCRIPTION /tmp/build_image/
RUN Rscript -e "remotes::install_deps('/tmp/build_image', dependencies = TRUE, upgrade = FALSE)"
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y texlive-base
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y texlive-recommended
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y texlive-lang-european

# Second step: use the installed packages directory
FROM $BASE_IMAGE
COPY --from=install_packages /usr/local/lib/R/site-library /usr/local/lib/R/site-library
# TeX Live babel-french is required for pdf compilation
RUN  tlmgr install babel-french \
  # After each tlmgr install as root, change right permissions (see https://github.com/rocker-org/rocker-versioned/issues/104)
  && chown -R root:staff /opt/TinyTeX \
  && chmod -R g+w /opt/TinyTeX \
  && chmod -R g+wx /opt/TinyTeX/bin
