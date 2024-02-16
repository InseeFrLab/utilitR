FROM inseefrlab/onyxia-rstudio:r4.3.2-2024.02.13

# R packages 
COPY ./DESCRIPTION /tmp/build_image/
RUN Rscript -e "install.packages(c('xfun','knitr', 'insee', 'OECD', 'htmltools'))"
RUN Rscript -e "remotes::install_deps('/tmp/build_image', dependencies = TRUE, upgrade = FALSE)"
RUN Rscript -e "remotes::install_github('kevinushey/rex')"
RUN Rscript -e "remotes::install_github('inseefrlab/inseelocaldata')"

RUN apt-get update \
    && apt-get -qq install gnupg
    
RUN sh -c 'echo "deb http://http.us.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list' \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138 \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9 \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605C66F00D6C9793

RUN apt-get update \
    && echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections

RUN apt-get -qq install --no-install-recommends \
       ttf-mscorefonts-installer \
       fonts-liberation \
       fonts-freefont-ttf \
       libssl-dev

RUN apt-get -qq install --no-install-recommends \
       imagemagick \
       libmagick++-dev \
       ghostscript \
       libglpk40

RUN apt-get -qq install --no-install-recommends \
       libgs-dev \
       librsvg2-dev \
       libwebp-dev \
       jq

RUN rm -rf /var/lib/apt/lists/* \
    && rm -rf /src/*.deb
RUN apt-get upgrade -y

# Installing mc

RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc


