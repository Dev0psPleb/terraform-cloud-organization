#!/usr/bin/env bash

read -r input < <(terraform init)
[[ $input = "yes" ]] && echo "OK"
