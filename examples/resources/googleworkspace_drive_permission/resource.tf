resource "googleworkspace_drive" "engineering" {
  name                    = "Engineering"
  use_domain_admin_access = true
}

resource "googleworkspace_drive_permission" "engineering_group" {
  file_id                 = googleworkspace_drive.engineering.id
  type                    = "group"
  email_address           = "engineering@example.com"
  role                    = "writer"
  use_domain_admin_access = true
}
