
# Switch branch
COMMIT_COUNT=$(git rev-list --count HEAD)

SUCCESSFUL_COMMITS=()

# Return the short commit hash of the current commit the head is pointing to
commit_hash() {
  local commit=$(git rev-parse --short HEAD)
  echo "$commit"
}

traverse_head() {
  # commit number to traverse to
  git checkout HEAD~$1
}

# Attempt Build
attempt_build() {

  pnpm build 
  if [[ $? == 1 ]]; then
    commit="$(commit_hash)"
    SUCCESSFUL_COMMITS+=( $commit )
    echo COMMIT: $commit
  fi
}

for ((currentCommit = 69; currentCommit < $COMMIT_COUNT; currentCommit++)); 
do
  traverse_head $currentCommit

  attempt_build $currentCommit

  # Return to main branch
  git switch -

  echo $currentCommit
done

echo ----------------

echo ${SUCCESSFUL_COMMITS[@]}
