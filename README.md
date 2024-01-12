# Personal Website Azure Serverless
[![Build Status](https://dev.azure.com/am55/AM55%20Portfolio%20Website/_apis/build/status%2FBuild%20CV%20Artifact?branchName=master)](https://dev.azure.com/am55/AM55%20Portfolio%20Website/_build/latest?definitionId=21&branchName=master)  ![Board Status](https://dev.azure.com/am55/f6afe483-c7f3-4cc4-b527-5a0fcac82c01/721abf1c-c98b-49bd-9b78-a12b3dfb840d/_apis/work/boardbadge/54f8307a-40e5-41a1-a0cb-682439adae04)
    
## About the Project
    
    This repo have all resources and code created to feature my own resume and landing page about myself, using Azure Services.

    Inspired by the Cloud Challenge book.

    Conceived since the begining as the lowest cost first and as fun sandbox to test my knowledge about Azure Services and resources.

### Services and Technologies used

* ``CSS`` ``HTML`` ``JavaScript`` ``C#`` ``.NET``
* ``Bicep`` ``PowerShell`` ``Shell``
* ``Azure Blob Storage``
* ``Azure Functions``
* ``CosmosDB``
* ``Azure CDN``
* ``Azure Pipelines & Boards``


    ## First Week

    -- Learned a bit of HTML/CSS and made a simple structure from scratch, good enough for now, but improve in styling is needed.

    -- Tried to emulate my actual CV as a website, almost there.

    -- Created an Azure Storage Account and used the Blob service as a static website.

    -- Site is up and running!  https://staticsiteacctest.z15.web.core.windows.net/

    -- Tried to use as much IaC as i can in this moment, created the full deployment using CLI(BlobStorage.sh).

    -- In the future maybe pass all of it to Bicep/ARM, tried a bit(DeployingResources.bicep), need to study more.


    ## Second Week

    API Time!

    -- Created a javascript visitor counter (main.js) and attached to the homepage.
    -- Several issues to make it work, but in the end we managed it
    -- Decided to changed the entire layout of the page, since my original was not working well with the counter.

    ## Third Week

    -- Migrated all my personal info to the new layout, not done yet.
    -- Created the web function utilizing Azure Functions to query a changed to Cosmos DB.
    -- Deployed all site content to a blob in Azure and utilized the static page service.
    -- Buy my custom domain, and integrated within registered in Azure
    -- Activated the CDN with my custom domain & endpoint, for faster response
    -- Created a pipeline with Azure Functions when a changed is detected on "frontend" folder repo.
    -- Added a automated test in the Get Counter function and inserted in the workflow "backend".


    ## Improving points ##

    -- Pass all infra to Bicep Templates and deploy to prod subscription
    -- Create a separated workflow for .pdf resume updates been uploaded automatically to the site
    -- Create the same pipelines on GitHub actions to Azure DevOps.

    


