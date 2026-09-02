resource "googleworkspace_org_unit" "engineering" {
  name                 = "Engineering"
  parent_org_unit_path = "/"
}

resource "googleworkspace_drive" "engineering" {
  name                    = "Engineering"
  use_domain_admin_access = true
}

resource "googleworkspace_drive_org_unit_membership" "engineering" {
  drive_id    = googleworkspace_drive.engineering.id
  org_unit_id = googleworkspace_org_unit.engineering.id
}
