#!/bin/bash

set -e

if [[ -z "$(which aws)" ]]; then
    echo "aws cli is not available"
    exit 1
fi

if [[ -z "$1" ]]; then
    echo "no source-profile provided"
    exit 1
fi
mfa_source=$1
mfa_target=$(echo "${mfa_source}" | cut -d'-' -f-2)

# get mfa serial
mfa_serial=$(aws configure get mfa_serial --profile ${mfa_source})

# get mfa token from user
read -p "Enter token for ${mfa_serial}: " mfa_token

if [[ -z "${mfa_token}" ]]; then
    echo "no token provided"
    exit 1
fi

number_check_regex="^[0-9]{6}$"
if ! [[ $mfa_token =~ $number_check_regex ]]; then
    echo "token must be 6 digits"
    exit 1
fi

session_token_string=$(aws sts get-session-token --profile $mfa_source --output text --serial-number $mfa_serial --token-code $mfa_token)
session_expiring=$(echo "${session_token_string}" | cut -f3)
session_access=$(echo "${session_token_string}" | cut -f2)
session_secret=$(echo "${session_token_string}" | cut -f4)
session_token=$(echo "${session_token_string}" | cut -f5)

aws configure set profile.${mfa_target}.aws_access_key_id $session_access
aws configure set profile.${mfa_target}.aws_secret_access_key $session_secret
aws configure set profile.${mfa_target}.aws_session_token $session_token

echo "session expires: ${session_expiring}"
