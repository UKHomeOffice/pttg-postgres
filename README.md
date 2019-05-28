Postgres Service
=

[![Docker Repository on Quay](https://quay.io/repository/ukhomeofficedigital/pttg-ip-hmrc-access-code/status "Docker Repository on Quay")](https://quay.io/repository/ukhomeofficedigital/pttg-postgres)

## Overview

This is the Postgres service. It serves to create the database the first time we deploy to an environment. 

## Find Us

* [GitHub]

## Building

### ACP

This service is built by Gradle on [Drone] using [Drone yaml].

## Infrastructure

### ACP

This service is packaged as a Docker image and stored on [Quay.io]

This service is deployed by [Drone] onto a Kubernetes cluster using its [Kubernetes configuration]

### EBSA

This service is packaged as a Docker image and stored on AWS ECR.

This service is deployed by [Jenkins] onto a Kubernetes cluster using the [deploy Jenkinsfile].

## Running Locally

You can run pttg_init.sh against a local database.

## Versioning

For the versions available, see the [tags on this repository].

## Authors

See the list of [contributors] who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENCE.md]
file for details.


[contributors]:                     https://github.com/UKHomeOffice/pttg-ip-hmrc-access-code/graphs/contributors
[Quay.io]:                          https://quay.io/repository/ukhomeofficedigital/pttg-postgres
[kubernetes configuration]:         https://github.com/UKHomeOffice/kube-pttg-postgres
[Drone]:                            https://drone.acp.homeoffice.gov.uk/UKHomeOffice/pttg-postgres
[Drone yaml]:                       .drone.yml
[tags on this repository]:          https://github.com/UKHomeOffice/pttg-ip-hmrc-access-code/tags
[LICENCE.md]:                       LICENCE.md
[GitHub]:                           https://github.com/orgs/UKHomeOffice/teams/pttg
