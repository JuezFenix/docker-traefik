!/bin/bash

echo "Preparing traefik files"
cp config/traefik2/traefik.log.example config/traefik2/traefik.log
cp config/traefik2/acme/acme.json.example config/traefik2/acme/acme.json

echo "Preparing authelia files"
cp config/authelia/configuration.yml.example config/authelia/configuration.yml
cp config/authelia/users_database.yml.example config/authelia/users_database.yml

echo "Preparing secret files"

cp secrets/authelia_duo_api_secret_key.example secrets/authelia_duo_api_secret_key
cp secrets/authelia_jwt_secret.example secrets/authelia_jwt_secret
cp secrets/authelia_notifier_smtp_password.example secrets/authelia_notifier_smtp_password
cp secrets/authelia_session_secret.example secrets/authelia_session_secret
cp secrets/authelia_storage_mysql_password.example secrets/authelia_storage_mysql_password

cp secrets/cloudflare_api_key.example secrets/cloudflare_api_key
cp secrets/cloudflare_api_token.example secrets/cloudflare_api_token
cp secrets/cloudflare_email.example secrets/cloudflare_email

cp secrets/google_client_id.example secrets/google_client_id
cp secrets/google_client_secret.example secrets/google_client_secret

cp secrets/guac_db_name.example secrets/guac_db_name
cp secrets/guac_mysql_password.example secrets/guac_mysql_password
cp secrets/guac_mysql_user.example secrets/guac_mysql_user

cp secrets/my_email.example secrets/my_email

cp secrets/mysql_root_password.example secrets/mysql_root_password

cp secrets/oauth_secret.example secrets/oauth_secret

cp secrets/plex_claim.example secrets/plex_claim
