terraform {
  cloud {
    organization = "sjw-terraform"   # ← 알려줘!

    workspaces {
      name = "terraform-github-automation"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {}
module "repos" {
  for_each = var.repositories
  source   = "./modules/github-repo"

  name                      = each.key
  description               = each.value.description
  visibility                = each.value.visibility
  enforce_branch_protection = each.value.enforce_branch_protection

  readme_content = <<-EOT
# ${each.key}

${each.value.description}

## 설치
```bash
git clone https://github.com/sjw1995628/${each.key}.git
```

## 라이선스

MIT License
EOT
}