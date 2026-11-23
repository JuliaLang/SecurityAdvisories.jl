#!/usr/bin/env bash
set -euo pipefail

base=$1
osv_commit=$2
source_commit=$(git rev-parse HEAD)

if git push --atomic origin "$source_commit:refs/heads/main" "$osv_commit:refs/heads/generated/osv"; then
    echo "ref=$source_commit" >> "$GITHUB_OUTPUT"
else
    git fetch --no-tags origin refs/heads/main
    upstream=$(git rev-parse FETCH_HEAD)
    if [[ "$upstream" == "$base" ]] || ! git merge-base --is-ancestor "$base" "$upstream"; then
        exit 1
    fi
    echo "Main advanced while exporting; the queued run will publish from its current tip."
fi
