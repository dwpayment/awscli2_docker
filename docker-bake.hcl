variable "REGISTRY" {
  default = ""
}

variable "TAG" {
    default = "tmp"
}

target "_common" {
  args = {
    REGISTRY = REGISTRY
    TAG = TAG
  }
}

group "default" {
  targets = ["awscli2"]
}

target "awscli2" {
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
  inherits = ["_common"]
  dockerfile = "Dockerfile"
  target = "builder"
  tags = ["${REGISTRY}awscli2:${TAG}"]
}
