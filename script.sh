#!/bin/bash

REPO=""
BASEURI="https://api.github.com"
ARTIFACTURI=$BASEURI/repos/$REPO/actions/artifacts
restResponse=$(curl \
-H "Accept: application/vnd.github.v3+json" \
-H "Authorization: token $TOKEN" \
$ARTIFACTURI)

echo $restResponse
