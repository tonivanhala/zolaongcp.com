terraform {
  backend "gcs" {
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.24.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

locals {
  domain              = var.domain
  github-organization = var.github-organization
  github-repository   = var.github-repository
  repository-path     = "${local.github-organization}/${local.github-repository}"
}

module "dns" {
  source     = "./dns"
  domain     = local.domain
  lb-address = module.lb.ip-address
}

module "lb" {
  source         = "./lb"
  backend-bucket = module.storage.bucket-name
  domain         = local.domain
}

module "identity" {
  source              = "./identity"
  github-organization = local.github-organization
}

module "storage" {
  source                 = "./storage"
  location               = "EU"
  github-repository-path = local.repository-path
  workload-identity-pool = module.identity.identity-pool
}
