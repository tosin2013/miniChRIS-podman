#!/bin/bash

#!/bin/bash

# Set the namespace and name for the ConfigMap
CONFIGMAP_NAME=secrets

if [ -f secrets.env ]; then
  source secrets.env
else
  echo "secrets.env file not found"
  exit 1
fi

# Create the ConfigMap YAML file
cat >secrets.yml<<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: ${CONFIGMAP_NAME}
data:
  DJANGO_SETTINGS_MODULE: ${DJANGO_SETTINGS_MODULE}
  CUBE_CELERY_POLL_INTERVAL: ${CUBE_CELERY_POLL_INTERVAL}
  DJANGO_ALLOWED_HOSTS: ${DJANGO_ALLOWED_HOSTS}
  DJANGO_SECRET_KEY: ${DJANGO_SECRET_KEY}
  DJANGO_CORS_ALLOW_ALL_ORIGINS: ${DJANGO_CORS_ALLOW_ALL_ORIGINS}
  DJANGO_CORS_ALLOWED_ORIGINS: ${DJANGO_CORS_ALLOWED_ORIGINS}
  DJANGO_SECURE_PROXY_SSL_HEADER: ${DJANGO_SECURE_PROXY_SSL_HEADER}
  DJANGO_USE_X_FORWARDED_HOST: ${DJANGO_USE_X_FORWARDED_HOST}
  STATIC_ROOT: ${STATIC_ROOT}
  DATABASE_HOST: ${DATABASE_HOST}
  DATABASE_PORT: ${DATABASE_PORT}
  POSTGRES_DB: ${POSTGRES_DB}
  POSTGRES_USER: ${POSTGRES_USER}
  POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
  CHRIS_STORE_URL: ${CHRIS_STORE_URL}
  SWIFT_CONTAINER_NAME: ${SWIFT_CONTAINER_NAME}
  SWIFT_AUTH_URL: ${SWIFT_AUTH_URL}
  SWIFT_USERNAME: ${SWIFT_USERNAME}
  SWIFT_KEY: ${SWIFT_KEY}
  CELERY_BROKER_URL: ${CELERY_BROKER_URL}
  AUTH_LDAP: ${AUTH_LDAP}
EOF
