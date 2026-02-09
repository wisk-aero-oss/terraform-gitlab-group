/**
 * # terraform-gitlab-group
 *
 * [![Releases](https://img.shields.io/github/v/release/wisk-aero-oss/terraform-gitlab-group)](https://github.com/wisk-aero-oss/terraform-gitlab-group/releases)
 *
 * [Terraform Module Registry](https://registry.terraform.io/modules/wisk-aero-oss/group/gitlab)
 *
 * Terraform module for managing a GitLab group
 *
 * ## Features
 *
 * - group management
 * - group badges
 * - group documentation project with README management
 *
 */

###-----------------------------
### Manage Group
###-----------------------------
resource "gitlab_group" "self" {
  name              = var.name
  avatar            = var.avatar
  avatar_hash       = filesha256(var.avatar)
  default_branch    = "main"
  description       = var.description
  emails_enabled    = true
  parent_id         = var.parent_id
  path              = var.path
  visibility_level  = "internal"
  wiki_access_level = "disabled"
  #default_branch_protection_defaults {}
  #push_rules { }
}

# N/A external wiki

# Pipeline status badges with placeholders
resource "gitlab_group_badge" "self" {
  for_each   = { for badge in var.badges : badge.name => badge }
  group      = gitlab_group.self.id
  link_url   = each.value.link_url
  image_url  = each.value.image_url
  name       = each.value.name
  depends_on = [gitlab_group.self]
}

###--------------------------------------
### Group documentation (README) project
###--------------------------------------
resource "gitlab_project" "gitlab-profile" {
  builds_access_level            = "disabled"
  default_branch                 = "main"
  description                    = "${title(var.name)} documentation"
  environments_access_level      = "disabled"
  feature_flags_access_level     = "disabled"
  group_runners_enabled          = false
  infrastructure_access_level    = "disabled"
  initialize_with_readme         = true
  issues_access_level            = "disabled"
  model_experiments_access_level = "disabled"
  model_registry_access_level    = "disabled"
  monitor_access_level           = "disabled"
  name                           = "gitlab-profile"
  namespace_id                   = gitlab_group.self.id
  requirements_access_level      = "disabled"
  topics                         = setunion(["documentation"], var.topics)
  visibility_level               = "internal"
  wiki_access_level              = "disabled"
  push_rules {
    prevent_secrets = true
  }
  depends_on = [gitlab_group.self]
}

# Manage group README.md file
resource "gitlab_repository_file" "readme" {
  project               = gitlab_project.gitlab-profile.id
  file_path             = "README.md"
  branch                = "main"
  encoding              = "text"
  content               = var.readme_content
  author_email          = var.readme_author_email
  author_name           = var.readme_author_name
  create_commit_message = var.readme_create_commit_message
  delete_commit_message = var.readme_delete_commit_message
  update_commit_message = var.readme_update_commit_message
  overwrite_on_create   = true
}
