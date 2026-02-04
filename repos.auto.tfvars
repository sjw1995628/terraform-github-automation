repositories = {
  "project-alpha" = {
    description               = "알파 프로젝트"
    visibility                = "public"
    enforce_branch_protection = true
  }
  "project-beta" = {
    description               = "베타 프로젝트"
    visibility                = "public"
    enforce_branch_protection = "true"
  }
  "project-gamma" = {
    description               = "감마 프로젝트"
    visibility                = "private"
    enforce_branch_protection = false
  }
  "project-delta" = {
    description               = "델타 프로젝트"
    visibility                = "public"
    enforce_branch_protection = true
  }
}