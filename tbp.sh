#!/bin/bash

USER_NAME="lieldulev"

if [[ $# -eq 0 ]] ; then
    echo 'Usage: "tbp PATH"'
    echo '         - PATH : A folder path/name to create a new tbp project in.'
    exit 1
fi

PRJ_PATH=$1
PRJ_NAME=${PRJ_PATH##*/}

echo ''
printf "Creating $PRJ_PATH... "

if [[ ! -e $PRJ_PATH ]]; then
    `mkdir -p $PRJ_PATH`
    echo "Done."
elif [[ ! -d $PRJ_PATH ]]; then
    echo "Error: $PRJ_PATH already exists but is not a directory! Exiting." 1>&2
    exit 0
else
    echo "$PRJ_PATH already exists. Okay."
fi

echo "Username on github [$USER_NAME]:"
read in_user

if [[ ! -z "${in_user// }" ]]; then
  USER_NAME=$in_user
fi


echo "Project name [$PRJ_NAME]:"
read in_name

if [[ ! -z "${in_name// }" ]]; then
  PRJ_NAME=$in_name
fi

echo "Project description:"
read in_description

echo "Project keywords (comma separated):"
read in_keywords
PRJ_KEYWORDS=${in_keywords//,/\",\"}

echo "Project REPO URL [lieldulev/$PRJ_NAME]:"
read in_repo

if [[ $in_repo == "https"* ]]; then # https://github.com/lieldulev/tbp
  USER_REPO=${in_repo/https:\/\/github.com\//}
elif [[ $in_repo == "git"* ]]; then # git@github.com:lieldulev/tbp.git
  USER_REPO=${in_repo/git@github.com:/}
elif [[ $in_repo == *"/"* ]]; then # lieldulev/tbp.git
  USER_REPO="$in_repo.git"
elif [[ ! -z "${in_repo// }" ]]; then # tbp
  USER_REPO="$USER_NAME/$in_repo.git"
else # enter
  USER_REPO="$USER_NAME/$PRJ_NAME.git"
fi

PRJ_REPO="git+https://github.com/$USER_REPO"
GIT_URL="git@github.com:$USER_REPO"
USER_PRJ=${USER_REPO:0:(${#USER_REPO}-4)}
TRACKERS_URL="https://github.com/$USER_PRJ/issues"
HOMEPAGE_URL="https://github.com/$USER_PRJ#readme"

echo "Copying files.."
# copy app folder as is
cp -r ./app $PRJ_PATH/app
# copy config folder as is
cp -r ./config $PRJ_PATH/config
# copy "special" files
files_to_copy=( package.json gulpfile.js LICENSE .gitignore )
for i in "${files_to_copy[@]}"
do
  cp $i $PRJ_PATH/$i
done

echo "Updating package.json"
sed -i '' -e s/PROJECT_NAME_HERE/$PRJ_NAME/ $PRJ_PATH/package.json
sed -i '' -e s/PROJECT_DESC_HERE/$in_description/ $PRJ_PATH/package.json
sed -i '' -e s/REPO_URL_HERE/${PRJ_REPO//\//\\/}/ $PRJ_PATH/package.json
sed -i '' -e s/KEYWORDS_HERE/$PRJ_KEYWORDS/ $PRJ_PATH/package.json
sed -i '' -e s/TRACKER_URL_HERE/${TRACKERS_URL//\//\\/}/ $PRJ_PATH/package.json
sed -i '' -e s/README_URL_HERE/${HOMEPAGE_URL//\//\\/}/ $PRJ_PATH/package.json

echo "Updating README.md"
echo "# $PRJ_NAME" > $PRJ_PATH/README.md
echo "$in_description" >> $PRJ_PATH/README.md

cd $PRJ_PATH

# init git repo
git init
git remote add origin $GIT_URL
git remote -v

echo "Run npm install? (y/n) [y]:"
read install_npm

if [[ $install_npm == "y" ]]; then
  npm install
elif [[ -z "${install_npm// }" ]]; then
  npm install
fi

echo "Done."
