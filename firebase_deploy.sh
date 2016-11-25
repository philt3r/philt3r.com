#!/bin/bash

TRAVIS_BRANCH=$1
FIREBASE_PROJECT_PHIL=$2
FIREBASE_TOKEN_PHIL=$3
FIREBASE_PROJECT_PROD=$4
FIREBASE_TOKEN_PROD=$5

# Test the branch and deploy where needed
if [[ ${TRAVIS_BRANCH} == *"feature"* ]]
then
	echo "Feature branch does not get deployed to firebase"
elif [[ ${TRAVIS_BRANCH} == *"develop"* ]]
then
	echo "Deploy to dev firebase environment"
	firebase deploy --debug --project "${FIREBASE_PROJECT_PHIL}" --token "${FIREBASE_TOKEN_PHIL}"
elif [[ ${TRAVIS_BRANCH} == *"master"* ]]
then
	echo "Master branch deploy to production"
	firebase deploy --project "${FIREBASE_PROJECT_PROD}" --token "${FIREBASE_TOKEN_PROD}"
else
	echo "Unknown branch type...not deploying"
fi

