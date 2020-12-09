#!/bin/sh

alias ga='git add --all'
alias gap='git add .; git commit --amend --no-edit; git push origin head --force'
alias gb='git branch'
alias gc='git commit -m'
alias gcd='git checkout develop'
alias gclean='git branch --merged | egrep -v "(^\*|master|develop)" | xargs git branch -d' # Clean up merged branches, except master and develop
alias gcm='git checkout master'
alias gpod='git pull origin develop'
alias gpoh='git push origin HEAD'
alias gpohf='git push origin HEAD --force'
alias gpom='git pull origin master'
alias gss='git status -s'
alias gstash='git stash'

function gitclean() {
  SIZE=$(du -sh .git)
  git remote prune origin && git repack && git prune-packed && git reflog expire --expire=1.month.ago && git gc --aggressive
  NEW_SIZE=$(du -sh .git)
  echo " "
  echo "Old size: $SIZE"
  echo "New size: $NEW_SIZE"
}