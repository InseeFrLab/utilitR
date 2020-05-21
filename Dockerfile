# see the original Dockerfile at https://github.com/rocker-org/binder/blob/master/Dockerfile
ARG GITLAB=gitlab.com
ARG REGISTRY=registry.$GITLAB
ARG REPO=linogaliana/documentationr

FROM $REGISTRY/$REPO:master

RUN /rocker_scripts/install_python.sh
RUN /rocker_scripts/install_binder.sh
