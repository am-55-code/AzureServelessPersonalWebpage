# Creating a custom domain for dev
az cdn custom-domain create --resource-group AM55-Web-Staging --endpoint-name dev-web-endpoint --profile-name am55cloudsite --name dev --hostname www.dev.am55.cloud

# Enabling HTTPS and SSL Certificates setting minimum TLS to 1.2
az cdn custom-domain enable-https --resource-group AM55-Web-Staging --profile-name am55cloudsite --endpoint-name dev-web-endpoint --name dev --min-tls-version 1.2