#!/bin/bash

REPO="Dev0psPleb/terraform-cloud-organization"
BASEURI="https://api.github.com"

get_artifacts() {
  repo=$REPO
  baseUri="https://api.github.com"
  token=$TOKEN
  artifactUri=$baseUri/repos/$repo/actions/artifacts

  curl \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: token $TOKEN" \
    $artifactUri
}

encrypt_state() {
  if test -f terraform.tfstate;
    openssl enc -in ./terraform.tfstate -aes256 -pbkdf2 -k ${{ secrets.encryptionkey }} -out ./terraform.tfstate.enc
}

terraform_state_artifacts(){
  get_artifacts | jq '.artifacts[]'
}

get_artifacts
#terraform_state_artifacts
