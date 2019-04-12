# Mule Blackbox Automated Testing (BAT)
> A Docker container for API Functional Monitoring with the Blackbox Automated Testing (BAT) CLI

This repository is used to build a Docker image which can be run in CI/CD pipelines.

## Getting started

To build the Docker image run the following command

```shell
bash build.sh
```

The code above creates a Docker image based on maven and installs BAT. To run the docker container and execute a test suite using BAT, run the following command:

```shell
docker run -rm -v "${PWD}/example":/usr/src/mymaven mule-blackbox-automated-testing:latest bat.yaml
```

## Related projects

Here's a list of other related projects:

- [Mule API Functional Monitoring](https://docs.mulesoft.com/api-functional-monitoring/bat-command-reference)
- [Docker Maven Image](https://hub.docker.com/_/maven/)

## Licensing

This project is licensed under Unlicense license. This license does not require
you to take the license with you to your project.
