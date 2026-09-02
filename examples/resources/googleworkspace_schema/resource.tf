resource "googleworkspace_schema" "employment" {
  schema_name  = "employment"
  display_name = "Employment"

  field {
    field_name   = "employee_id"
    field_type   = "STRING"
    display_name = "Employee ID"
    indexed      = true
  }

  field {
    field_name       = "start_date"
    field_type       = "DATE"
    display_name     = "Start Date"
    read_access_type = "ADMINS_AND_SELF"
  }
}

resource "googleworkspace_user" "developer" {
  primary_email = "ada@example.com"

  name {
    given_name  = "Ada"
    family_name = "Lovelace"
  }

  custom_schemas {
    schema_name = googleworkspace_schema.employment.schema_name

    schema_values = {
      employee_id = jsonencode("E-1024")
      start_date  = jsonencode("2026-01-05")
    }
  }
}
