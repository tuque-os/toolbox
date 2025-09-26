export registry := "ghcr.io/tuque-os"
export image := "toolbox"
export fedora_version := "43"

build:
    podman build \
    --build-arg "VERSION=${fedora_version}.$(git rev-parse --short HEAD).$(date +%Y%m%d)" \
    --build-arg "FEDORA_MAJOR_VERSION=${fedora_version}" \
    --pull=newer \
    --tag "${registry}/${image}:latest" \
    .

run-container:
    podman run --rm -it "${registry}/${image}:latest"

# check Justfile syntax
check:
    just --unstable --fmt --check -f Justfile

# watch latest gh workflow run
ci:
    gh run watch \
    $(gh run list --commit $(git rev-parse origin/HEAD) --json databaseId --jq .[].databaseId)
