resource "googleworkspace_group" "engineering" {
  email = "engineering@example.com"
  name  = "Engineering"
}

resource "googleworkspace_user" "developer" {
  primary_email = "ada@example.com"

  name {
    given_name  = "Ada"
    family_name = "Lovelace"
  }
}

resource "googleworkspace_group_members" "engineering" {
  group_id = googleworkspace_group.engineering.id

  members {
    email = googleworkspace_user.developer.primary_email
    role  = "MEMBER"
  }

  members {
    email = "manager@example.com"
    role  = "OWNER"
  }
}
