# ExMan1 as a Service
Deployable artefact of the first semester, the output of ALG and OOP. Private due to copyrights of ExMan.

## Third Party Artefact
Modern day engineering depends mostly on third party components. To have one third party component for our transfer tasks at ABB Technikerschule, we treat the first Version of ExMan as third party piece (which it is, since M.B. built and compiled it).

## Maintenace
The `.jar` from the subjects ALG and OOP is stored in this repo and gets built into a Docker image. Said image gets deployed to a Azure App Service.

## Pipeline overview

Repo --> Github Action Pushing a new container image (can be used by other subjects like WEG or CCT) --> GitHub Action deploys said image as `latest` to Azure App Service.

https://exman.azurewebsites.net/exman

## Features

* Fully automated, each change to master reaches directly _production_.
* Resets (by Github Action) every night at 12 and upon deployment.
* Can be deployed manually by workflow dispatch.

## App Service
The App Service runs on a free tier thus does not consume any Azure Credits.

## Container registry

The images get pushed to ndshfswe.azurecr.io which is a private Azure Container Registry.

## Permissions

The project is private since

* it is technically a third party repo
* the `ExMan.jar` is intellectual property of M.B.

### Repo
Ask [@mambax](https://github.com/mambax)

### Azure
(incl ACR and App Service)

Ask [@mambax](https://github.com/mambax) or A.W. (is co-administrator already).

---

### Why did you not host it on Azure DevOps?
Because the permissions are more elaborate and for now this is enough. We can switch to Azure DevOps anytime someone has time and motivation.

Azure DevOps would solve the permissioning issue at least 🔐
