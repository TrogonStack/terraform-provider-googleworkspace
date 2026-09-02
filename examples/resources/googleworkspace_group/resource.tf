resource "googleworkspace_group" "engineering" {
  email       = "engineering@example.com"
  name        = "Engineering"
  description = "Everyone in the engineering organization"
  aliases     = ["eng@example.com"]
}
