ARG BASE_IMAGE=rocker/geospatial:latest

# Use a multi-stage build to install packages
# First stage: install packages
FROM $BASE_IMAGE AS install_packages
# LaTeX packages 
COPY ./_latex_requirements.txt /tmp/build_image/
RUN tlmgr update --self
RUN tlmgr install `cat /tmp/build_image/_latex_requirements.txt | tr '\r\n' ' '`
# R packages 
COPY ./DESCRIPTION /tmp/build_image/
RUN Rscript -e "remotes::install_deps('/tmp/build_image', dependencies = TRUE, upgrade = FALSE)"

# Second stage: use the installed packages directories
FROM $BASE_IMAGE
COPY --from=install_packages /opt/texlive /opt/texlive
COPY --from=install_packages /usr/local/texlive /usr/local/texlive
COPY --from=install_packages /usr/local/lib/R/site-library /usr/local/lib/R/site-library


# Third stage: prepare bookdown
RUN apt-get update \
    && apt-get -qq install gnupg \
    && sh -c 'echo "deb http://http.us.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list' \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC \
    && apt-get update \
    && echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections \
    && apt-get -qq install --no-install-recommends \
       ttf-mscorefonts-installer \
       fonts-liberation \
       fonts-freefont-ttf \
       libssl-dev \
       chromium \
       imagemagick \
       libmagick++-dev \
       ghostscript \
       libgs-dev \
       librsvg2-dev \
       libwebp-dev \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /src/*.deb

# Change right permissions (see https://github.com/rocker-org/rocker-versioned/issues/104)
RUN  chown -R root:staff /opt/texlive \
  && chown -R root:staff /usr/local/texlive \
  && chmod -R 777 /opt/texlive \
  && chmod -R 777 /usr/local/texlive
