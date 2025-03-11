output "identity-pool" {
    value = google_iam_workload_identity_pool.github.name
}

output "identity-provider" {
    value = google_iam_workload_identity_pool_provider.github.name
}
