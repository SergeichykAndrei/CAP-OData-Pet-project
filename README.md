# SAP CAP ODATA Pet Project

## Description
This is a training project to learn how to implement Java backend microservices based on CAP framework on SAP BTP Cloud Foundry Platform

## Getting Started
* To create cap java project follow [official documentation](https://cap.cloud.sap/docs/java/getting-started):
  * first way mvn archetype:generate `-DarchetypeArtifactId="cds-services-archetype" -DarchetypeGroupId="com.sap.cds" -DarchetypeVersion="RELEASE" -DinteractiveMode=true`
  * second one by cds `cds init <PROJECT-ROOT> --add java`
* To create simple project follow next [tutorial](https://developers.sap.com/mission.cap-java-app.html)
* To enreach your CDS models and services with required annotations use corresponding section of [official documentation] (https://cap.cloud.sap/docs/guides/) and this [example] (https://github.com/SAP-samples/cloud-cap-samples-java/tree/main)
* When you get to the section of creating a database in a BTP environment, do it according to the following [tutorial](https://developers.sap.com/tutorials/btp-app-hana-cloud-setup.html)
* When you start deploying your project to SAP BTP it's recommended to create mta configuration automatically, follow [official documentation] (https://cap.cloud.sap/docs/guides/deployment/to-cf) then configure security and another configuration files according to [tutorial](https://developers.sap.com/tutorials/cp-cap-java-deploy-cf.html)
  * put your predeployed hana database instance id in configuration of hdi-container, ex: `database-id: aa19983f-8c05-4852-b603-e77e0736f304`
* Documentation for setting up [multitenancy](https://cap.cloud.sap/docs/java/multitenancy) in your application 


### Prerequisites
Before running the app in the Cloud Foundry environment, you need:
* To have your own BTP trial account.
* SAP Hana Cloud instance deployed. 

### Deploy on Cloud
To deploy the app in the Cloud Foundry environment, follow these steps:
1. Build the jar file: `mvn clean package -DskipTests`
2. Build tar archive: `mbt build -t gen --mtar mta.tar`
3. Deploy app: `cf deploy gen/mta.tar `


### Multi-tenancy

- The SaaS Provisioning Service sends a subscribe event to the CAP application.
- The CAP application delegates the request to the MTX services.
- The MTX services use Service Manager to create the database tenant.
- The CAP Application connects to this tenant at runtime using Service Manager.

## To enable multitenancy on SAP BTP, three services are involved:

- XSUAA (xsuaa)
- Service Manager (service-manager)
- SaaS Provisioning service (saas-registry)
Only when these services are bound to your application, the multitenancy feature is turned on.

## Enable Multitenancy
- add MTX Sidecar application:
`cds add multitenancy --for production`
- add(bind) created mtx-sidecar container with your xsuaa service. 
- delete hdi-container service and db-deployer module if previously you used them in non-multitenant configuration.
- you can delete from MTX Sidecar module next line:
`SUBSCRIPTION_URL: ~{app-protocol}://\${tenant_subdomain}-~{app-uri}`
- in package.json of mtx/sidecar folder I changed line from:
`"build": "cds build ../.. --for mtx-sidecar --production && npm ci --prefix gen"`
to
`"build": "cds build ../.. --for mtx-sidecar --production && npm install --prefix gen"`
- add next configuration in your xs-security.json file:
`{
  "xsappname": "cap-odata-auth",
  "tenant-mode": "shared",
  "scopes": [
  {
  "name": "$XSAPPNAME.mtcallback",
  "description": "Multi Tenancy Callback Access",
  "grant-as-authority-to-apps": [
  "$XSAPPNAME(application, sap-provisioning, tenant-onboarding)"
  ]
  },
  {
  "name": "$XSAPPNAME.mtdeployment",
  "description": "Scope to trigger a re-deployment of the database artifacts"
  }
  ],
  "authorities": [
  "$XSAPPNAME.mtdeployment"
  ]}`
- add Service Manager service :
`  - name: service-manager
  type: org.cloudfoundry.managed-service
  parameters:
  service: service-manager
  service-plan:
  container`
- add service-manager service in required properties of main application and MTX Sidecar module 

## Install Dependencies
`npm i`
