# see the original Dockerfile at https://github.com/rocker-org/binder/blob/master/Dockerfile
ARG GITLAB=gitlab.com
ARG REGISTRY=registry.$GITLAB
ARG REPO=linogaliana/documentationr

FROM $REGISTRY/$REPO:master

RUN /rocker_scripts/install_python.sh
RUN /rocker_scripts/install_binder.sh

## Copies your repo files into the Docker Container
COPY Rprofile ${HOME}
RUN mv ${HOME}/Rprofile ${HOME}/.Rprofile
RUN git clone https://gitlab.com/linogaliana/documentationr.git ${HOME}/documentationR
USER root
RUN chown -R ${NB_USER} ${HOME} && \
    chown -R ${NB_USER}:staff /opt/texlive && \
    chown -R ${NB_USER}:staff /usr/local/texlive && \
    chmod -R ug+w /opt/texlive && \
    chmod -R ug+w /usr/local/texlive

## Become normal user again
USER ${NB_USER}
