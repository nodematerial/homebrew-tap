#!/bin/bash
# Point Formula/cch.rb at the latest cch release. Prints the new version, or nothing when already current
set -eu

FORMULA="${FORMULA:-Formula/cch.rb}"
REPO="nodematerial/cch"

tag=$(gh api "repos/$REPO/releases/latest" -q .tag_name)
version="${tag#v}"
current=$(sed -n 's#.*/archive/refs/tags/v\(.*\)\.tar\.gz".*#\1#p' "$FORMULA")
[ "$version" = "$current" ] && exit 0

url="https://github.com/$REPO/archive/refs/tags/$tag.tar.gz"
sha=$(curl -fsSL "$url" | shasum -a 256 | cut -d' ' -f1)
sed -i.bak -E \
  -e "s#^  url \".*\"#  url \"$url\"#" \
  -e "s#^  sha256 \".*\"#  sha256 \"$sha\"#" \
  "$FORMULA"
rm -f "$FORMULA.bak"
echo "$version"
