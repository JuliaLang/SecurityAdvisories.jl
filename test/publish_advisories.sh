#!/usr/bin/env bash
set -euo pipefail

publish=$(cd "$(dirname "${BASH_SOURCE[0]}")/../scripts" && pwd)/publish_advisories.sh
test_dir=$(mktemp -d)
trap 'rm -rf -- "$test_dir"' EXIT
export GITHUB_OUTPUT="$test_dir/output"
export GIT_AUTHOR_NAME=Test GIT_AUTHOR_EMAIL=test@example.com
export GIT_COMMITTER_NAME=Test GIT_COMMITTER_EMAIL=test@example.com

git init --quiet --bare "$test_dir/origin.git"
git init --quiet --initial-branch=main "$test_dir/work"
cd "$test_dir/work"
git remote add origin "$test_dir/origin.git"

commit() {
    git commit --quiet --allow-empty -m "$1"
    git rev-parse HEAD
}

remote_ref() {
    git --git-dir="$test_dir/origin.git" rev-parse "$1"
}

base=$(commit 'First merge')
tree=$(git rev-parse 'HEAD^{tree}')
osv_base=$(git commit-tree "$tree" -m 'Initial OSV')
git push --quiet origin "$base:refs/heads/main" "$osv_base:refs/heads/generated/osv"

assignment=$(commit 'Assign IDs after first merge')
osv_candidate=$(git commit-tree "$tree" -p "$osv_base" -m 'First export')

git switch --quiet --detach "$base"
next_merge=$(commit 'Second merge arrives before publication')
git push --quiet origin "$next_merge:refs/heads/main"
git switch --quiet --detach "$assignment"
touch "$GITHUB_OUTPUT"
bash "$publish" "$base" "$osv_candidate"
[[ ! -s "$GITHUB_OUTPUT" ]]
[[ $(remote_ref refs/heads/main) == "$next_merge" ]]
[[ $(remote_ref refs/heads/generated/osv) == "$osv_base" ]]

git switch --quiet --detach "$next_merge"
assignment=$(commit 'Assign IDs from current main')
bash "$publish" "$next_merge" "$osv_candidate"
[[ $(<"$GITHUB_OUTPUT") == "ref=$assignment" ]]
[[ $(remote_ref refs/heads/main) == "$assignment" ]]
[[ $(remote_ref refs/heads/generated/osv) == "$osv_candidate" ]]

: > "$GITHUB_OUTPUT"
later_assignment=$(commit 'Another ID assignment')
if bash "$publish" "$assignment" "$osv_base"; then
    echo "Expected a non-fast-forward OSV push to fail"
    exit 1
fi
[[ ! -s "$GITHUB_OUTPUT" ]]
[[ $(remote_ref refs/heads/main) != "$later_assignment" ]]
[[ $(remote_ref refs/heads/main) == "$assignment" ]]
[[ $(remote_ref refs/heads/generated/osv) == "$osv_candidate" ]]
echo 'Atomic advisory publication tests passed'
