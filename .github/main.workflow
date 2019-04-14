workflow "Build" {
  on = "push"
  resolves = [
    "Push Docker image with latest",
    "Push Docker image with build number",
  ]
}

action "Authenticate with Docker Registry" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Build Docker Image" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Authenticate with Docker Registry"]
  args = "build -f Dockerfile --tag mule-blackbox-automated-testing ."
}

action "Tag Docker Image with build number" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Build Docker Image"]
  args = "tag mule-blackbox-automated-testing mule-blackbox-automated-testing:$GITHUB_SHA"
}

action "Tag Docker Image with latest" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Build Docker Image"]
  args = "tag mule-blackbox-automated-testing mule-blackbox-automated-testing:latest"
}

action "Push Docker image with latest" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Tag Docker Image with latest"]
  args = "push mule-blackbox-automated-testing:latest"
}

action "Push Docker image with build number" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Tag Docker Image with build number"]
  args = "push mule-blackbox-automated-testing:$GITHUB_SHA"
}
