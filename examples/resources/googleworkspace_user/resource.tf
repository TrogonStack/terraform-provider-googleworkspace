resource "googleworkspace_user" "developer" {
  primary_email = "ada@example.com"
  org_unit_path = "/Engineering"

  name {
    given_name  = "Ada"
    family_name = "Lovelace"
  }
}
