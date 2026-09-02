terraform {
  required_providers {
    googleworkspace = {
      source = "trogonstack/googleworkspace"
    }
  }
}

provider "googleworkspace" {
  service_account         = "terraform@my-project.iam.gserviceaccount.com"
  impersonated_user_email = "admin@example.com"
  customer_id             = "C01abc23d"
}
