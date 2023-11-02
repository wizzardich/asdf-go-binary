#!/usr/bin/env bash

set -Eeuo pipefail

# detect the tool name
__dirname="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
toolname="$(basename "$(dirname "${__dirname}")")"
readonly __dirname
readonly toolname

GH_REPO_LOCATION=$(yq ".binaries.$toolname.github" $__dirname/registry.yaml)
GH_REPO="https://${GH_REPO_LOCATION}.git"
GO_PROJECT=$(yq ".binaries.$toolname.package.project" $__dirname/registry.yaml)
GO_MODULE=$(yq ".binaries.$toolname.package.module" $__dirname/registry.yaml)
GO_INSTALLED_TOOL_NAME=$(yq ".binaries.$toolname.binary.name" $__dirname/registry.yaml)
GO_INSTALLED_TOOL_TEST=$(yq ".binaries.$toolname.binary.test" $__dirname/registry.yaml)


fail() {
	echo -e "asdf-go-binary: $toolname $*"
	exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if go-binary is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_go_module_versions() {
  VERSIONS=$(go list -m -versions "$GO_PROJECT" | tr ' ' '\n' | sed 's/^v//' | grep -v "$GO_PROJECT" || true)

  echo $VERSIONS | tr ' ' '\n'
}

list_all_versions() {
	list_github_tags
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"

	# TODO: Adapt the release URL convention for go-binary
	url="$GH_REPO/archive/v${version}.tar.gz"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="v$2"
  local install_path="${3%/bin}/bin"

  if [ "$install_type" != "version" ]; then
    fail "asdf-go-binary: $toolname supports release installs only"
  fi

  if [ "$version" == "v0.0.0" ]; then
    version="latest"
  fi

  (
    GOBIN="${install_path}" go install "${GO_MODULE}@${version}"

    local tool_cmd
    tool_cmd="$(echo "$GO_INSTALLED_TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

    echo "$toolname $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error occurred while installing $toolname $version."
  )
}
