#!/usr/bin/env bash
# Usage: ./new-version.sh <wine-staging version>   e.g. ./new-version.sh 11.8
set -euo pipefail

version="${1:?usage: $0 <version>}"
cd "$(dirname "$0")"
template="templates/wine-staging.rb.template"
target="Casks/wine-staging@${version}.rb"
url="https://github.com/Gcenx/macOS_Wine_builds/releases/download/${version}/wine-staging-${version}-osx64.tar.xz"

if [[ -e "$target" ]]; then
  echo "$target already exists" >&2
  exit 1
fi

echo "Downloading $url"
sha256="$(curl -fL "$url" | shasum -a 256 | awk '{print $1}')"

sed -e "s/{{VERSION}}/${version}/g" -e "s/{{SHA256}}/${sha256}/g" "$template" > "$target"

echo "Created $target (sha256 $sha256)"
