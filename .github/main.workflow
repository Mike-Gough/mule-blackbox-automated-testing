workflow "Build" {
  on = "push"
  resolves = ["Authenticate with Docker Registry"]
}

action "Authenticate with Docker Registry" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Build Docker Image" {
  uses = "actions/docker/cli@master"
  needs = ["Authenticate with Docker Registry"]
  args = "build -f Dockerfile --tag mule-blackbox-automated-testing ."
}

action "Tag Docker Image with build number" {
  uses = "actions/docker/cli@master"
  needs = ["Build Docker Image"]
  args = "--tag mule-blackbox-automated-testing mule-blackbox-automated-testing:$GITHUB_SHA"
}

action "Publish Docker Image with build number" {
  uses = "actions/docker/cli@master"
  needs = ["Tag Docker Image with build number"]
  args = "push mule-blackbox-automated-testing:$GITHUB_SHA"
}

action "Tag Docker Image with latest" {
  uses = "actions/docker/cli@master"
  needs = ["Build Docker Image"]
  args = "--tag mule-blackbox-automated-testing mule-blackbox-automated-testing:latest"
}

action "Publish Docker Image with latest" {
  uses = "actions/docker/cli@master"
  needs = ["Tag Docker Image with latest"]
  args = "push mule-blackbox-automated-testing:latest"
}
