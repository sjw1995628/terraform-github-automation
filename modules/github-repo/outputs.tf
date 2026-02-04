output "repo_url" {
  value = github_repository.this.html_url
}
output "repo_name" {
  value = github_repository.this.name
}
output "clone_url" {
  value = github_repository.this.git_clone_url
}