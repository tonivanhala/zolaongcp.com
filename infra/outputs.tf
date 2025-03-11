output "nameservers" {
  value = module.dns.nameservers
}

output "bucket_name" {
  value = module.storage.bucket-name
}

output "identity_provider" {
  value = module.identity.identity-provider
}
