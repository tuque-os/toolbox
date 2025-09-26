ARG FEDORA_MAJOR_VERSION

FROM ghcr.io/tuque-os/workstation:latest as workstation

FROM scratch AS ctx
COPY / /

FROM quay.io/fedora/fedora-toolbox:${FEDORA_MAJOR_VERSION}

ARG VERSION=""

RUN --mount=type=bind,from=ctx,src=/,dst=/ctx \
    --mount=type=bind,from=workstation,src=/,dst=/workstation \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build_files/build.sh

ENTRYPOINT "fish"
