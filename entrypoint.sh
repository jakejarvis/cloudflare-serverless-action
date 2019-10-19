#!/bin/bash

#ACTION_WORKSPACE=/worker-deploy

if [ -e $GITHUB_WORKSPACE/serverless.yml ]
then
    echo 'Custom serverless.yml found. Replacing default config.'
    rm $ACTION_WORKSPACE/serverless.yml
    cp $GITHUB_WORKSPACE/serverless.yml $ACTION_WORKSPACE
fi

cp $GITHUB_WORKSPACE/*.js $ACTION_WORKSPACE

cd $ACTION_WORKSPACE && sls deploy
