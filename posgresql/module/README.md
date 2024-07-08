# Terraform Module: GCP POSTGRESQL

This Terraform module provisions a Google Cloud PostgreSQL with various configurable properties.

## Example Repo:
git clone https://github.com/cloudeq-EMU-ORG/ceq_tf_template_gcp_war_postgresql

## User Guide

### Using the Resource Block

The following resource block defines the creation of PostgreSQL:

```hcl
resource "google_project_service" "enable_sqladmin_api" {
  service            = "sqladmin.googleapis.com"
  project            = var.project_id
  disable_on_destroy = false
}

# Creating the sql Database instance
resource "google_sql_database_instance" "main" {
  
  name             = var.postgress_ins
  database_version = "POSTGRES_15"
  region           = var.region
  project          = var.project_id

  settings {
    tier              = var.db_tier
    edition           = var.db_edition
    availability_type = var.db_aval_type
    user_labels       = var.user_labels

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.private_network
      require_ssl     = true 
    }

    database_flags {
      name  = "cloudsql.enable_pgaudit"
      value = "on"
    }

    database_flags {
      name  = "log_connections"
      value = "on"
    }

    database_flags {
      name  = "log_disconnections"
      value = "on"
    }

    database_flags {
      name  = "log_error_verbosity"
      value = "default"
    }

    database_flags {
      name  = "log_min_duration_statement"
      value = "-1"
    }

    database_flags {
      name  = "log_checkpoints"
      value = "on"
    }

    database_flags {
      name  = "log_lock_waits"
      value = "on"
    }

    database_flags {
      name  = "log_statement_stats"
      value = "off"
    }

    database_flags {
      name  = "log_temp_files"
      value = "0"
    }

    database_flags {
      name  = "log_planner_stats"
      value = "off"
    }

    database_flags {
      name  = "log_hostname"
      value = "on"
    }

    database_flags {
      name  = "log_parser_stats"
      value = "off"
    }

    database_flags {
      name  = "log_executor_stats"
      value = "off"
    }

    backup_configuration {
      enabled                          = true
      start_time                       = "02:00"
      location                         = "us"
      point_in_time_recovery_enabled   = true
      transaction_log_retention_days   = 7
    }
  }

  deletion_protection = false
}

# Creating the SQL user
resource "google_sql_user" "user" {
  name     = var.username
  instance = google_sql_database_instance.main.name
  password = var.db_password
  project  = var.project_id
}

Using the Variables
The following variables are available for configuring the Postgresql:

#required variables

variable "postgress_ins" {
  description = "The  postgress instance name"
  type = string
}

variable "username" {
  description = "The sql user name for postgresql"
  type = string
}

variable "db_password" {
  description = "The password for sql db"
  type =string
}



variable "private_network" {
  description = "The private_network name for postgresql"
  type = any
  
}

# optional variables

variable "project_id" {
  description = "The project ID"
  type = string
}

variable "region" {
  description = "The region"
  type        = string
}
variable "user_labels" {
  description = "(optional) - Resource labels to represent user-provided metadata."
  type        = map(string)
  default     = { }

}

variable "managed_service" {
  description = "(optional)  The name of Google Managed Service "
  type        = string
  default     = null
}

variable "db_tier" {
  description = "The db_tier name for postgresql"
  type =string
}

variable "db_edition" {
  description = "The db_edition name for postgresql"
  type =string
}

variable "db_aval_type" {
  description = "The db_aval_type  for postgresql"
  type =string
}
