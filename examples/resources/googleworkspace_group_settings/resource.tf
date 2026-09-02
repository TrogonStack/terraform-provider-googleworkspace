resource "googleworkspace_group" "announcements" {
  email = "announcements@example.com"
  name  = "Announcements"
}

resource "googleworkspace_group_settings" "announcements" {
  email                   = googleworkspace_group.announcements.email
  who_can_view_membership = "ALL_MANAGERS_CAN_VIEW"
  who_can_post_message    = "ALL_OWNERS_CAN_POST"
}
