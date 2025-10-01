#!/usr/bin/env bash
# Small utility-script to report
# changes in collection of git-repos
# TODO Rename-Proposal: Repo-Drift(ers)
# ----
# TODO: ALSO INCLUDE UPSTREAM-CHANGES IN THE REPORT
#       (i.e. 'There are both pushable and pullable
#              changes available in your repos.')

find ~/conf ~/repos -maxdepth 3 -type d -name ".git" -exec sh -c '
  repo_dir=$(dirname "{}")
  # Capture the output of git status -s
  status_output=$(cd "$repo_dir" && git status -s)
  # Check if the output is NOT empty
  if [ ! -z "$status_output" ]; then
    echo -e "\n--- Status for: \033[1m$repo_dir\033[0m (HAS CHANGES) ---"
    echo "$status_output"
  fi
' \;

# find ~/conf ~/repos -maxdepth 3 -type d -name ".git" -exec sh -c '
#     repo_dir=$(dirname "{}")
#     
#     # Change to the repository directory
#     (
#         cd "$repo_dir" || exit 1
#         
#         # 1. Check for local uncommitted changes
#         local_status_output=$(git status -s)
#         
#         # 2. Check for remote updates (changes that can be pulled)
#         
#         # First, fetch updates from the remote (quietly)
#         # This updates the remote tracking branches (e.g., origin/main)
#         git fetch --quiet 
#         
#         # Get the name of the current branch
#         current_branch=$(git rev-parse --abbrev-ref HEAD)
#         
#         # Get the name of the remote tracking branch (e.g., origin/main)
#         # The '|| echo ""' is a safety net in case there is no upstream branch set
#         remote_branch=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || echo "")
# 
#         remote_status=""
#         
#         if [ -n "$remote_branch" ]; then
#             # Compare the local branch with its remote tracking branch
#             # See if the local branch is behind the remote
#             if git rev-list --left-only --count "$remote_branch"...HEAD >/dev/null 2>&1; then
#                 # If behind, we use git rev-list to count commits
#                 commits_behind=$(git rev-list --left-only --count "$remote_branch"...HEAD 2>/dev/null)
#                 if [ "$commits_behind" -gt 0 ]; then
#                     remote_status="\n\033[33m!! Local branch is BEHIND remote by $commits_behind commit(s). PULL RECOMMENDED !!\033[0m"
#                 fi
#             fi
#         else
#              # No upstream branch is set, which is a state that should be flagged
#              remote_status="\n\033[31m!! WARNING: No upstream branch set for $current_branch !!\033[0m"
#         fi
#         
#         # 3. Print the combined status if either local or remote changes are found
#         if [ ! -z "$local_status_output" ] || [ ! -z "$remote_status" ]; then
#             echo -e "\n--- Status for: \033[1m$repo_dir\033[0m ---"
#             
#             # Print local changes status
#             if [ ! -z "$local_status_output" ]; then
#                 echo -e "\033[31m(HAS UNCOMMITTED/UNSTAGED LOCAL CHANGES)\033[0m"
#                 echo "$local_status_output"
#             fi
#             
#             # Print remote changes status
#             if [ ! -z "$remote_status" ]; then
#                 echo -e "$remote_status"
#             fi
#         fi
# 
#     )
# ' \;
