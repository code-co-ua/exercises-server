#!/bin/bash

# Update current repository
git pull

cd $HOME

mkdir -p "exercises"
cd exercises

repositories=(
  "https://github.com/code-co-ua/exercises-php"
);

for repository in "${repositories[@]}"
do
  dir=$(basename $repository)
  if [ ! -d "$dir" ]; then
    git clone "$repository"
  fi

  cd $dir
  git pull
  make build-images
done
