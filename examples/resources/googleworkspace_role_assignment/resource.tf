data "googleworkspace_role" "group_admin" {
  name = "_GROUPS_ADMIN_ROLE"
}

resource "googleworkspace_user" "admin" {
  primary_email = "group-admin@example.com"

  name {
    given_name  = "Grace"
    family_name = "Hopper"
  }
}

resource "googleworkspace_role_assignment" "group_admin" {
  role_id     = data.googleworkspace_role.group_admin.id
  assigned_to = googleworkspace_user.admin.id
}
