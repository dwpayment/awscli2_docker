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
  platforms = [
    "linux/amd64",
    "linux/arm64/v8"
  ]
  targets = ["awscli2"]
}

target "awscli2" {
  inherits = ["_common"]
  dockerfile = "Dockerfile"
  target = "builder"
  tags = ["${REGISTRY}awscli2:${TAG}"]
}
