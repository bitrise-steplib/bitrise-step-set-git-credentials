#!/usr/bin/env bash
set -eo pipefail

if [[ -z "${git_user_name}" ]]; then
  echo "Warning: the Git Username (git_user_name) input is empty." >&2
fi

if [[ -z "${git_email_address}" ]]; then
  echo "Warning: the Git Email Address (git_email_address) input is empty." >&2
fi

echo "Setting the global Git identity:"
echo "  user.name:  ${git_user_name}"
echo "  user.email: ${git_email_address}"

git config --global user.name "${git_user_name}"
git config --global user.email "${git_email_address}"

echo "Done. Subsequent Steps will use this identity for Git commits and tags."
