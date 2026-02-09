<!-- BEGIN_TF_DOCS -->
# terraform-gitlab-group

[![Releases](https://img.shields.io/github/v/release/wisk-aero-oss/terraform-gitlab-group)](https://github.com/wisk-aero-oss/terraform-gitlab-group/releases)

[Terraform Module Registry](https://registry.terraform.io/modules/wisk-aero-oss/group/gitlab)

Terraform module for managing a GitLab group

## Features

- group management
- group badges
- group documentation project with README management

## Usage

Basic usage of this module is as follows:

```hcl
module "example" {
    source = "wisk-aero-oss/group/gitlab"
    # Recommend pinning every module to a specific version
    # version = "x.x.x"
    # Required variables
        avatar =
        description =
        name =
        parent_id =
        path =
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | >= 18.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 18.8.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_group.self](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group) | resource |
| [gitlab_group_badge.self](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group_badge) | resource |
| [gitlab_project.gitlab-profile](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project) | resource |
| [gitlab_repository_file.readme](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/repository_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_avatar"></a> [avatar](#input\_avatar) | GitLab Group avatar file path | `string` | n/a | yes |
| <a name="input_badges"></a> [badges](#input\_badges) | List of group badges to create | <pre>list(object({<br/>    name      = string<br/>    link_url  = string<br/>    image_url = string<br/>  }))</pre> | <pre>[<br/>  {<br/>    "image_url": "https://%{gitlab_server}/%{project_path}/badges/%{default_branch}/coverage.svg",<br/>    "link_url": "https://%{gitlab_server}/%{project_path}/-/jobs",<br/>    "name": "badge-coverage"<br/>  },<br/>  {<br/>    "image_url": "https://%{gitlab_server}/%{project_path}/badges/%{default_branch}/pipeline.svg",<br/>    "link_url": "https://%{gitlab_server}/%{project_path}/-/pipelines?ref=%{default_branch}",<br/>    "name": "badge-pipeline"<br/>  },<br/>  {<br/>    "image_url": "https://%{gitlab_server}/%{project_path}/-/badges/release.svg",<br/>    "link_url": "https://%{gitlab_server}/%{project_path}/-/releases",<br/>    "name": "badge-release"<br/>  }<br/>]</pre> | no |
| <a name="input_description"></a> [description](#input\_description) | GitLab Group description | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | GitLab Group name | `string` | n/a | yes |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | GitLab Group parent\_id | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | GitLab Group path | `string` | n/a | yes |
| <a name="input_readme_author_email"></a> [readme\_author\_email](#input\_readme\_author\_email) | Email of the author for the group README file | `string` | `"terraform@example.com"` | no |
| <a name="input_readme_author_name"></a> [readme\_author\_name](#input\_readme\_author\_name) | Name of the author for the group README file | `string` | `"Terraform"` | no |
| <a name="input_readme_content"></a> [readme\_content](#input\_readme\_content) | Content for the group README file | `string` | `"Welcome to the group documentation"` | no |
| <a name="input_readme_create_commit_message"></a> [readme\_create\_commit\_message](#input\_readme\_create\_commit\_message) | Commit message for creating the group README file | `string` | `"docs: create README file"` | no |
| <a name="input_readme_delete_commit_message"></a> [readme\_delete\_commit\_message](#input\_readme\_delete\_commit\_message) | Commit message for deleting the group README file | `string` | `"docs: delete README file"` | no |
| <a name="input_readme_update_commit_message"></a> [readme\_update\_commit\_message](#input\_readme\_update\_commit\_message) | Commit message for updating the group README file | `string` | `"docs: update README file"` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | GitLab Group topics | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_full_path"></a> [full\_path](#output\_full\_path) | Group full path |
| <a name="output_id"></a> [id](#output\_id) | Group ID |

<!-- END_TF_DOCS -->
