# Required Variables

variable "database_version" {
  description = "(optional) - The MySQL, PostgreSQL or SQL Server (beta) version to use. Supported values include MYSQL_5_6, MYSQL_5_7, MYSQL_8_0, POSTGRES_9_6,POSTGRES_11, SQLSERVER_2017_STANDARD, SQLSERVER_2017_ENTERPRISE, SQLSERVER_2017_EXPRESS, SQLSERVER_2017_WEB. Database Version Policies includes an up-to-date reference of supported versions."
  type        = string
}

variable "name" {
  description = "(optional) - The name of the instance. If the name is left blank, Terraform will randomly generate one when the instance is first created. This is done because after a name is used, it cannot be reused for up to one week."
  type        = string
}

variable "private_network" {
  description = "(optional) - The name of the instance. If the name is left blank, Terraform will randomly generate one when the instance is first created. This is done because after a name is used, it cannot be reused for up to one week."
  type        = string
  
}


# Optional Variables

variable "region" {
  description = "(optional) - The region the instance will sit in. Note, Cloud SQL is not available in all regions. A valid region must be provided to use this resource. If a region is not provided in the resource definition, the provider region will be used instead, but this will be an apply-time error for instances if the provider region is not supported with Cloud SQL. If you choose not to provide the region argument for this resource, make sure you understand this."
  type        = string
  default     = null
}

variable "project_id" {
  description = "The project ID"
  type = string
}


variable "tier" {
  description = "(optional) - The name of the instance. If the name is left blank, Terraform will randomly generate one when the instance is first created. This is done because after a name is used, it cannot be reused for up to one week."
  type        = string
  default     = null
  
}

variable "instance" {
   description = "(required) - The name of the Cloud SQL instance. This does not include the project\nID."
   type        = string
   default     = null
 }

variable "db_name" {
  description = "(required) - The name of the database in the Cloud SQL instance.\nThis does not include the project ID or instance name."
  type        = string
  default     = null
}

variable "username" {
  description = "(optional) - The region the instance will sit in. Note, Cloud SQL is not available in all regions. A valid region must be provided to use this resource. If a region is not provided in the resource definition, the provider region will be used instead, but this will be an apply-time error for instances if the provider region is not supported with Cloud SQL. If you choose not to provide the region argument for this resource, make sure you understand this."
  type        = string
  default     = null
}

variable "password" {
  description = "(optional) - The region the instance will sit in. Note, Cloud SQL is not available in all regions. A valid region must be provided to use this resource. If a region is not provided in the resource definition, the provider region will be used instead, but this will be an apply-time error for instances if the provider region is not supported with Cloud SQL. If you choose not to provide the region argument for this resource, make sure you understand this."
  type        = string
  default     = null
}

variable "deletion_protection" {
  description = "(optional) - Used to block Terraform from deleting a SQL Instance."
  type        = bool
  default     = null
  
}

variable "user_labels" {
  description = "A map of key-value pairs to apply as labels to the Data Fusion instance."
  type        = map(string)
  
}

variable "db_aval_type" {
  description = "The db_aval_type  for mysql"
  type =string
  default     = "REGIONAL"
}

variable "enabled" {
  description = "enabled for mysql backup configuration"
  type = bool
  default     = true
  
}

variable "binary_log_enabled" {
  description = "binary_log_enabled for mysql backup configuration"
  type = bool
  default     = true
  
}

variable "ipv4_enabled" {
  description = "The ipv4_enabled  for mysql ip configuration"
  type = bool
  default = true
}

variable "require_ssl" {
  description = "The require_ssl name for mysql ip configuration"
  type = string
  default     = "ENCRYPTED_ONLY"
  
}



# #required variables

# variable "postgress_ins" {
#   description = "The  postgress instance name"
#   type = string
# }

# variable "database_version" {
#   description = "The  postgress  database_version"
#   type = string
# }

# variable "username" {
#   description = "The sql user name for postgresql"
#   type = string
# }

# variable "db_password" {
#   description = "The password for sql db"
#   type =string
# }



# # variable "private_network" {
# #   description = "The private_network name for postgresql"
# #   type = any
  
# # }

# # optional variables

# variable "project_id" {
#   description = "The project ID"
#   type = string
# }

# variable "region" {
#   description = "The region"
#   type        = string
# }
# variable "user_labels" {
#   description = " Resource labels to represent user-provided metadata."
#   type        = map(string)
#   default     = { }

# }

# variable "managed_service" {
#   description = " The name of Google Managed Service "
#   type        = string
#   default     = null
# }

# variable "db_tier" {
#   description = "The db_tier name for postgresql"
#   type =string
# }

# variable "db_edition" {
#   description = "The db_edition name for postgresql"
#   type =string
# }

# variable "db_aval_type" {
#   description = "The db_aval_type  for postgresql"
#   type =string
# }

# variable "start_time" {
#   description = "The start time  for backup configuration"
#   type =string
#   default     = "02:00"
                      
# }

# variable "location" {
#   description = "The location  for backup configuration"
#   type =string
#   default     = "us"
# }



# variable "disable_on_destroy" {
#   description = "The disable_on_destroy  for postgresql"
#   type = bool
  
# }

# variable "ipv4_enabled" {
#   description = "The ipv4_enabled  for postgresql ip configuration"
#   type = bool
  
# }

# variable "require_ssl" {
#   description = "The require_ssl name for postgresql ip configuration"
#   type = bool
#   default     = true
  
# }

# variable "enabled" {
#   description = "enabled for postgresql backup configuration"
#   type = bool
#   default     = true
  
# }

# variable "point_in_time_recovery_enabled" {
#   description = "point_in_time_recovery_enabled for postgresql backup configuration"
#   type = bool
#   default     = true
  
# }

# variable "transaction_log_retention_days" {
#   description = "The transaction_log_retention_days for backup configuration"
#   type =number
#   default     = 7
# }


# variable "deletion_protection" {
#   description = "deletion_protection for postgresql"
#   type = bool
  
# }