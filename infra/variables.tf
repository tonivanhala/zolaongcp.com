variable "project" {
  type = string
}

variable "region" {
  type    = string
  default = "europe-north1"
}

variable "zone" {
  type    = string
  default = "europe-north1-a"
}

variable "domain" {
  type = string
}

variable "github-organization" {
  type = string
}

variable "github-repository" {
  type = string
}
