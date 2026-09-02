resource "googleworkspace_drive" "engineering" {
  name                    = "Engineering"
  use_domain_admin_access = true

  restrictions {
    domain_users_only               = true
    copy_requires_writer_permission = true
  }
}
