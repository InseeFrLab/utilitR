FROM rocker/geospatial:4.0.4

# R packages 
COPY ./DESCRIPTION /tmp/build_image/
RUN Rscript -e "install.packages(c('xfun','knitr', 'insee', 'OECD'))"
RUN Rscript -e "remotes::install_deps('/tmp/build_image', dependencies = TRUE, upgrade = FALSE)"
RUN Rscript -e "remotes::install_github('rstudio/bookdown')"
RUN Rscript -e "remotes::install_github('inseefrlab/inseelocaldata')"
RUN Rscript -e "remotes::install_github('inseefrlab/doremifasol')"

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
       imagemagick \
       libmagick++-dev \
       ghostscript \
       libgs-dev \
       librsvg2-dev \
       libwebp-dev \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /src/*.deb \
    && apt-get upgrade -y

RUN apt-get update && \
  apt-get -yq install wget apt-transport-https ca-certificates gnupg --no-install-recommends && \
  apt-get -yq install libgconf-2-4 && \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' &&\
  apt-get update && \
  apt-get -yq install google-chrome-stable --no-install-recommends 

# Installing mc

RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc

# Change right permissions (see https://github.com/rocker-org/rocker-versioned/issues/104)
# RUN  chown -R root:staff /opt/texlive \
#   && chown -R root:staff /usr/local/texlive \
#   && chmod -R 777 /opt/texlive \
#   && chmod -R 777 /usr/local/texlive
