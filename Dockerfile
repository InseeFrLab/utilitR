# see the original Dockerfile at https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/Dockerfile_binder_4.0.0
ARG GITLAB=gitlab.com
ARG REGISTRY=registry.$GITLAB
ARG REPO=linogaliana/documentationr

FROM $REGISTRY/$REPO:master

## Copy your files into the Docker Container
ENV NB_USER rstudio
ENV NB_UID 1000
ENV HOME /home/${NB_USER}
# Change user
USER ${NB_USER}
# Copy Rprofile to /home/rstudio/.Rprofile
COPY Rprofile ${HOME}/.Rprofile
# Clone project
RUN git clone "https://$GITLAB/$REPO.git" ${HOME}/documentationR
# Back to root
USER root

# Fix rights permissions
RUN chown -R ${NB_USER} ${HOME} && \
    chown -R ${NB_USER}:staff /opt/texlive && \
    chown -R ${NB_USER}:staff /usr/local/texlive && \
    chmod -R ug+w /opt/texlive && \
    chmod -R ug+w /usr/local/texlive

# Install python
RUN /rocker_scripts/install_python.sh
# Install binder
RUN /rocker_scripts/install_binder.sh
