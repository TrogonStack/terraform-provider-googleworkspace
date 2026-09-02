resource "googleworkspace_org_unit" "engineering" {
  name                 = "Engineering"
  parent_org_unit_path = "/"
  description          = "Engineering organization"
}

resource "googleworkspace_org_unit" "platform" {
  name                 = "Platform"
  parent_org_unit_path = googleworkspace_org_unit.engineering.org_unit_path
}
