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
