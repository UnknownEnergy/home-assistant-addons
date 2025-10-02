#!/usr/bin/env bash
#!/usr/bin/with-contenv bashio

# ------------------------------------------------------------------------------
# Returns a downloadlink from a given version
#
# Arguments:
#   $1 bedrock version number
# ------------------------------------------------------------------------------
function hasp::version() {
    local input_version=${1}
    local download_link=""

    if [ "$input_version" = "LATEST" ]; then
        input_version="LATEST"
    else
        # shellcheck disable=SC2002
        download_link="https://www.minecraft.net/bedrockdedicatedserver/bin-linux-preview/bedrock-server-1.21.120.24.zip"
    fi
    echo "${download_link}"
}


# ------------------------------------------------------------------------------
# Cleans the given path by removing most of the files
#
# Arguments:
#   $1 work directory
# ------------------------------------------------------------------------------
function hasp::version.cleanup() {
    local cleanup_path=${1}
    local path_stack=""

    path_stack=$(pwd)

    cd "${cleanup_path}" || exit 1

    mv ./worlds /tmp/worlds 2> /dev/null || true
    rm -rf -- * 2> /dev/null || true
    mv /tmp/worlds . 2> /dev/null || true
    cd "${path_stack}" || exit 1
}
