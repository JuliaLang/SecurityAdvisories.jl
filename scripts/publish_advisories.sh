#!/usr/bin/env bash
set -euo pipefail

base=$1
osv_commit=$2
source_commit=$(git rev-parse HEAD)

if [[ "$source_commit" == "$base" ]]; then
    if [[ "$osv_commit" == "$(git rev-parse refs/remotes/origin/generated/osv)" ]]; then
        remote_main=$(git ls-remote --exit-code origin refs/heads/main)
        if [[ "${remote_main%%$'\t'*}" == "$base" ]]; then
            echo "ref=$source_commit" >> "$GITHUB_OUTPUT"
        else
            echo "Main advanced while exporting; skipping website deployment."
        fi
        exit 0
    fi

    # An up-to-date ref is omitted from an atomic push.
    source_commit=$(git commit-tree 'HEAD^{tree}' -p "$base" -m '[automated] publish OSV export')
fi

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
