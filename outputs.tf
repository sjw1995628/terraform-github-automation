output "repo_urls" {
  value = { for k, v in module.repos : k => v.repo_url }
}