#!/bin/bash

SECRET_NAME="json-encoded-secret"

SECRET_VALUE=$(aws secretsmanager get-secret-value --secret-id $SECRET_NAME --query 'SecretString' --output text)

if [ -z "$SECRET_VALUE" ]; then
  echo "Error: Unable to retrieve secret value."
  exit 1
fi

USERNAME=$(echo "$SECRET_VALUE" | jq -r '.username')
PASSWORD=$(echo "$SECRET_VALUE" | jq -r '.password')
EMAIL=$(echo "$SECRET_VALUE" | jq -r '.email')

echo "Username: $USERNAME"
echo "Password: $PASSWORD"
echo "Email: $EMAIL"
