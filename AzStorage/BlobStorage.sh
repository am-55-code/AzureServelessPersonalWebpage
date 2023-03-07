# Seting the Test Subscription Scope
az account set --subscription 9d1017be-3e3c-48f6-94ff-13047e872bbf

# Creating a Storage Account
az storage account create \
--name staticsiteacctest \
--resource-group test-crc \
--location brazilsouth \
--sku Standard_LRS

# Enabling static 
az storage blob service-properties update \
--account-name staticsiteacctest \
--static-website \ 
--index-document index.html

#Uploding Site files
az storage blob upload-batch -s <source-path> -d '$web' --account-name <storage-account-name>
