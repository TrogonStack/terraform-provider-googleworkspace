# terraform-provider-googleworkspace

**A Terraform provider that manages your Google Workspace tenant as code.** It covers the Admin SDK Directory, Groups Settings, and Drive APIs behind a single provider configuration.

**The provider turns Workspace administration into declarative resources.** Users, groups and their memberships, organizational units, custom user schemas, admin role assignments, shared drives, and Drive permissions all become Terraform resources with full create, read, update, delete, and import support. Authentication runs through a service account with Domain-Wide Delegation impersonating an administrator, so no long-lived user credentials are involved.

**It exists because Workspace administration is otherwise click-driven and unauditable.** The Admin Console leaves no record of who changed what or why, drift accumulates silently, and the same onboarding steps get repeated by hand for every new hire. Expressing the tenant as Terraform configuration puts those changes under code review, makes them reproducible across environments, and lets Workspace state live alongside the rest of your infrastructure.

**It is useful to platform and IT engineering teams who already run Terraform** and want identity, group membership, and Drive access managed by the same pipeline as their cloud resources. It is equally useful to anyone who was relying on HashiCorp's archived provider and needs a maintained continuation that also reaches the Drive API.

## Provider configuration

```hcl
provider "googleworkspace" {
  service_account         = "terraform@my-project.iam.gserviceaccount.com"
  impersonated_user_email = "admin@example.com"
  customer_id             = "C01abc23d"
}
```

| Attribute                 | Environment variable          | Description                                                                                                           |
| ------------------------- | ----------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `service_account`         | `SERVICE_ACCOUNT`             | Service account email to impersonate for Domain-Wide Delegation. Required.                                            |
| `impersonated_user_email` | `SUBJECT`                     | Workspace administrator the service account acts as. Required.                                                        |
| `customer_id`             | `GOOGLEWORKSPACE_CUSTOMER_ID` | Workspace customer ID. Required for Admin SDK resources.                                                              |
| `access_token`            | n/a                           | Pre-minted OAuth2 access token used as the base credential instead of Application Default Credentials.                |
| `oauth_scopes`            | n/a                           | OAuth scopes for the API client. Defaults to a set covering Admin SDK, Groups Settings, and Drive.                    |
| `retry_on`                | n/a                           | Additional HTTP status codes to retry. Defaults to `[502]`; 429, 403 quota errors, and 5xx (except 501) always retry. |

Credentials resolve from Application Default Credentials unless `access_token` is set. Nothing is read from a service account key file on disk.

## Resources and data sources

| Type                                        | API                    |
| ------------------------------------------- | ---------------------- |
| `googleworkspace_user`                      | Admin SDK Directory    |
| `googleworkspace_group`                     | Admin SDK Directory    |
| `googleworkspace_group_members`             | Admin SDK Directory    |
| `googleworkspace_group_settings`            | Groups Settings        |
| `googleworkspace_org_unit`                  | Admin SDK Directory    |
| `googleworkspace_role_assignment`           | Admin SDK Directory    |
| `googleworkspace_schema`                    | Admin SDK Directory    |
| `googleworkspace_drive`                     | Drive                  |
| `googleworkspace_drive_permission`          | Drive                  |
| `googleworkspace_drive_org_unit_membership` | Cloud Identity / Drive |
| `googleworkspace_role` (data source)        | Admin SDK Directory    |

## Example

```hcl
resource "googleworkspace_org_unit" "engineering" {
  name                 = "Engineering"
  parent_org_unit_path = "/"
}

resource "googleworkspace_user" "developer" {
  primary_email = "developer@example.com"
  org_unit_path = googleworkspace_org_unit.engineering.org_unit_path

  name {
    given_name  = "Ada"
    family_name = "Lovelace"
  }
}

resource "googleworkspace_group" "engineering" {
  email = "engineering@example.com"
  name  = "Engineering"
}

resource "googleworkspace_group_members" "engineering" {
  group_id = googleworkspace_group.engineering.id

  members {
    email = googleworkspace_user.developer.primary_email
    role  = "MEMBER"
  }
}
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for the development setup, test workflow, and release process.
