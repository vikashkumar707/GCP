# resource "google_project_service" "enable_sqladmin_api" {
#   service            = "sqladmin.googleapis.com"
#   project            = var.project_id
#   disable_on_destroy = var.disable_on_destroy
# }

resource "google_sql_database_instance" "this" { 
  name             = var.name
  database_version = var.database_version
  region           = var.region
  project          = var.project_id
  deletion_protection = var.deletion_protection
settings {
    tier = var.tier
    availability_type = var.db_aval_type
    user_labels  = var.user_labels


    database_flags {
      name  = "skip_show_database"
      value = "on"
    }

    database_flags {
      name  = "local_infile"
      value = "off"
    }

    backup_configuration {
      enabled            = var.enabled
      binary_log_enabled = var.binary_log_enabled
    }

    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.private_network
      ssl_mode        = var.require_ssl
    }

  }
}

resource "google_sql_database" "this" {
   name = var.db_name
   project  = var.project_id 
   instance = google_sql_database_instance.this.name

   
}
resource "google_sql_user" "users" {
  name     = var.username
  project  = var.project_id 
  instance = google_sql_database_instance.this.name
  password = var.password
}
  


# # Creating the sql Database instance
# resource "google_sql_database_instance" "main" {
  
#   name             = var.postgress_ins
#   database_version = var.database_version
#   region           = var.region
#   project          = var.project_id

#   settings {
#     tier              = var.db_tier
#     edition           = var.db_edition
#     availability_type = var.db_aval_type
#     user_labels       = var.user_labels

#     ip_configuration {
#       ipv4_enabled    = var.ipv4_enabled
#       # private_network = var.private_network
#       # require_ssl     = var.require_ssl
#     }

#     database_flags {
#       name  = "log_bin"
#       value = "on"
#     }

#      database_flags {
#       name  = "log_bin_trust_function_creators"
#       value = "on"
#     }

#     # database_flags {
#     #   name  = "log_connections"
#     #   value = "on"
#     # }

#     # database_flags {
#     #   name  = "log_disconnections"
#     #   value = "on"
#     # }

#     # database_flags {
#     #   name  = "log_error_verbosity"
#     #   value = "default"
#     # }

#     # database_flags {
#     #   name  = "log_min_duration_statement"
#     #   value = "-1"
#     # }

#     # database_flags {
#     #   name  = "log_checkpoints"
#     #   value = "on"
#     # }

#     # database_flags {
#     #   name  = "log_lock_waits"
#     #   value = "on"
#     # }

#     # database_flags {
#     #   name  = "log_statement_stats"
#     #   value = "off"
#     # }

#     # database_flags {
#     #   name  = "log_temp_files"
#     #   value = "0"
#     # }

#     # database_flags {
#     #   name  = "log_planner_stats"
#     #   value = "off"
#     # }

#     # database_flags {
#     #   name  = "log_hostname"
#     #   value = "on"
#     # }

#     # database_flags {
#     #   name  = "log_parser_stats"
#     #   value = "off"
#     # }

#     # database_flags {
#     #   name  = "log_executor_stats"
#     #   value = "off"
#     # }

#     # backup_configuration {
#     #   enabled                          = var.enabled
#     #   start_time                       = var.start_time
#     #   location                         = var.location
#     #   point_in_time_recovery_enabled   = var.point_in_time_recovery_enabled
#     #   transaction_log_retention_days   = var.transaction_log_retention_days
#     # }
#   }

#   deletion_protection = var.deletion_protection
# }

# # Creating the SQL user
# resource "google_sql_user" "user" {
#   name     = var.username
#   instance = google_sql_database_instance.main.name
#   password = var.db_password
#   project  = var.project_id
# }  
  
