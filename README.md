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
