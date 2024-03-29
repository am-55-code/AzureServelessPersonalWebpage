# Create a SQL API serverless account with database and container

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location="Brazil South"
resourceGroup="test-crc"
tag="serverless-sql-cosmosdb"
account="cloudchallengecosmosdb-dev$randomIdentifier" #needs to be lower case
database="cloudchallengecosmosdb-dev"
container="container1"
partitionKey="/partitionKey"

# Create a resource group
echo "Creating $resourceGroup in $location..."
az group create --name $resourceGroup --location "$location" --tags $tag

# Create a Cosmos account for SQL API
az cosmosdb create --name $account --resource-group $resourceGroup --default-consistency-level Eventual
 --locations regionName="$location" failoverPriority=0 isZoneRedundant=False --capabilities EnableServerless

# Create a SQL API database
echo "Creating $database"
az cosmosdb sql database create --account-name $account --resource-group $resourceGroup --name $database

# Create a SQL API container
echo "Creating $container with $partitionKey"
az cosmosdb sql container create --account-name $account --resource-group $resourceGroup --database-name $database --name $container --partition-key-path $partitionKey