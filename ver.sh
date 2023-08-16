#! /bin/bash
npm version patch
version=`git diff HEAD^..HEAD -- "$(git rev-parse --show-toplevel)"/package.json | grep '^\+.*version' | sed -s 's/[^0-9\.]//g'`
echo "version: "+version
git add *;
echo "Git Added "
git commit -m "Commit message"
echo "Commit Message Added "

if [ "$version" != "" ]; then
    echo "In IF "
    git tag -a "v$version" -m "`git log -1 --format=%s`"
    echo "Git Tag added"
    echo "Created a new tag, v$version"
    git push --tags
    echo "Git Tag Push"
    npm publish
    echo "NPM PUSH"
fi
