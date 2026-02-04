resource "github_repository" "this" {
  name        = var.name
  description = var.description
  visibility  = var.visibility

  has_issues   = var.has_issues
  has_wiki     = var.has_wiki
  has_projects = false

  auto_init = var.auto_init
}
resource "github_branch_protection" "main" {
  count = var.enforce_branch_protection ? 1 : 0

  repository_id = github_repository.this.node_id
  pattern       = var.default_branch

  required_pull_request_reviews {
    required_approving_review_count = var.required_reviewers
  }

  allows_force_pushes = false

  allows_deletions = false
}
resource "github_issue_label" "labels" {
  for_each = var.labels

  repository  = github_repository.this.name
  name        = each.key
  color       = each.value.color
  description = each.value.description
}
resource "github_repository_file" "readme"{
  count=var.readme_content!=null?1:0

  repository=github_repository.this.name
  branch="main"
  file="README.md"
  content=var.readme_content
  commit_message="docs: README 자동 생성"
  overwrite_on_create=true
}