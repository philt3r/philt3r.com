#!/bin/bash

TRAVIS_BRANCH=$1
FIREBASE_PROJECT_PROD=$2
FIREBASE_TOKEN_PROD=$3

if [[ ${TRAVIS_BRANCH} == *"master"* ]]
then
	echo "Master branch deploy to production"
	firebase deploy --debug --project "${FIREBASE_PROJECT_PROD}" --token "${FIREBASE_TOKEN_PROD}"
else
	echo "Unknown branch type...not deploying"
fi

