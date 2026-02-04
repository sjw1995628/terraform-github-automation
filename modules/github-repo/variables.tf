variable "name" {
  type        = string
  description = "Repository 이름"
}
variable "description" {
  type        = string
  description = "Repository 설명"
  default     = ""
}
variable "visibility" {
  type        = string
  description = "public 또는 private"
  default     = "public"
  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "visibility는 public 또는 private이어야 해요"
  }
}

variable "has_issues" {
  type    = bool
  default = true
}
variable "has_wiki" {
  type    = bool
  default = false
}

variable "auto_init" {
  type    = bool
  default = true
}
variable "default_branch" {
  type        = string
  default     = "main"
  description = "기본 브랜치 이름"
}
variable "enforce_branch_protection" {
  type        = bool
  default     = true
  description = "브랜치 보호 규칙 적용 여부"
}
variable "required_reviewers" {
  type        = number
  default     = 0
  description = "PR승인에 필요한 리뷰어 수 (0이면 리뷰 불필요)"
}
variable "labels" {
  type = map(object({
    color       = string
    description = string
  }))
  default = {
    "bug" = {
      color       = "d73a4a"
      description = "버그 수정"
    }
    "feature" = {
      color       = "a2eeef"
      description = "새 기능"
    }
    "documentation" = {
      color       = "0075ca"
      description = "문서 작업"
    }
    "help wanted" = {
      color       = "008672"
      description = "도움 필요"
    }
  }
  description = "생성할 라벨 목록"
}
variable "readme_content"{
  type= string
  description = "README.md 내용"
  default = null
}