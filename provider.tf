terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.30.0"
    }
  }
}

provider "google" {
  project = "ceq-devops-sandbox"
}
terraform{
  backend "gcs" {}

}