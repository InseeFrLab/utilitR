# see the original Dockerfile at https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/Dockerfile_binder_4.0.0
FROM registry.gitlab.com/linogaliana/documentationr:master

RUN /rocker_scripts/install_python.sh

ENV PYTHON_VENV_PATH=/usr
RUN /rocker_scripts/install_binder.sh

ENV NB_USER=${NB_USER:-rstudio}
ENV WORKDIR=${WORKDIR:-/home/${NB_USER}}
## Copy files into the Docker image
# Copy Rprofile to /home/rstudio/.Rprofile
COPY --chown=${NB_USER}:${NB_USER} Rprofile ${WORKDIR}/.Rprofile
# Change user
USER ${NB_USER}
# Clone project
RUN git clone https://gitlab.com/linogaliana/documentationr.git ${WORKDIR}/documentationR
# Back to root
USER root
