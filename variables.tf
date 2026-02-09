variable "avatar" {
  description = "GitLab Group avatar file path"
  type        = string
}
# Variables available in badges
# https://docs.gitlab.com/user/project/badges/#placeholders
variable "badges" {
  description = "List of group badges to create"
  type = list(object({
    name      = string
    link_url  = string
    image_url = string
  }))
  default = [
    {
      name      = "coverage"
      link_url  = "https://%%{gitlab_server}/%%{project_path}/-/jobs"
      image_url = "https://%%{gitlab_server}/%%{project_path}/badges/%%{default_branch}/coverage.svg"
    },
    {
      name      = "pipeline"
      link_url  = "https://%%{gitlab_server}/%%{project_path}/-/pipelines?ref=%%{default_branch}"
      image_url = "https://%%{gitlab_server}/%%{project_path}/badges/%%{default_branch}/pipeline.svg"
    },
    {
      name      = "release"
      link_url  = "https://%%{gitlab_server}/%%{project_path}/-/releases"
      image_url = "https://%%{gitlab_server}/%%{project_path}/-/badges/release.svg"
    },
  ]
}
variable "description" {
  description = "GitLab Group description"
  type        = string
}
variable "name" {
  description = "GitLab Group name"
  type        = string
}
variable "parent_id" {
  description = "GitLab Group parent_id"
  type        = string
}
variable "path" {
  description = "GitLab Group path"
  type        = string
}

variable "readme_content" {
  description = "Content for the group README file"
  type        = string
  default     = "Welcome to the group documentation"
}
variable "readme_author_email" {
  description = "Email of the author for the group README file"
  type        = string
  default     = "terraform@example.com"
}
variable "readme_author_name" {
  description = "Name of the author for the group README file"
  type        = string
  default     = "Terraform"
}
variable "readme_create_commit_message" {
  description = "Commit message for creating the group README file"
  type        = string
  default     = "docs: create README file"
}
variable "readme_delete_commit_message" {
  description = "Commit message for deleting the group README file"
  type        = string
  default     = "docs: delete README file"
}
variable "readme_update_commit_message" {
  description = "Commit message for updating the group README file"
  type        = string
  default     = "docs: update README file"
}

variable "topics" {
  description = "GitLab Group topics"
  type        = set(string)
  default     = []
}
