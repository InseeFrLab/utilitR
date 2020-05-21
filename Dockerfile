# see the original Dockerfile at https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/Dockerfile_binder_4.0.0
FROM registry.gitlab.com/linogaliana/documentationr:master

ENV NB_USER=${NB_USER:-rstudio}
ENV WORKDIR=${WORKDIR:-/home/${NB_USER}}

## Copy files into the Docker image
# Change user
USER ${NB_USER}
# Copy Rprofile to /home/rstudio/.Rprofile
COPY Rprofile ${WORKDIR}
# Clone project
RUN git clone https://gitlab.com/linogaliana/documentationr.git ${WORKDIR}/documentationR
# Back to root
USER root

# Fix rights permissions
RUN chown -R rstudio /home/rstudio && \
    chown -R rstudio:staff /opt/texlive && \
    chown -R rstudio:staff /usr/local/texlive && \
    chmod -R ug+w /opt/texlive && \
    chmod -R ug+w /usr/local/texlive

# Install python
RUN /rocker_scripts/install_python.sh
# Install binder
RUN /rocker_scripts/install_binder.sh
