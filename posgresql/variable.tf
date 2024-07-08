#required variables

variable "postgress_ins" {
  description = "The  postgress instance name"
  type = string
}

variable "database_version" {
  description = "The  postgress  database_version"
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
  description = " Resource labels to represent user-provided metadata."
  type        = map(string)
  default     = { }

}

variable "managed_service" {
  description = " The name of Google Managed Service "
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

variable "start_time" {
  description = "The start time  for backup configuration"
  type =string
  default     = "02:00"
                      
}

variable "location" {
  description = "The location  for backup configuration"
  type =string
  default     = "us"
}

variable "transaction_log_retention_days" {
  description = "The transaction_log_retention_days for backup configuration"
  type =number
}


variable "disable_on_destroy" {
  description = "The disable_on_destroy  for postgresql"
  type = bool
  
}

variable "ipv4_enabled" {
  description = "The ipv4_enabled  for postgresql ip configuration"
  type = bool
  
}

variable "require_ssl" {
  description = "The require_ssl name for postgresql ip configuration"
  type = bool
  
}

variable "enabled" {
  description = "enabled for postgresql backup configuration"
  type = bool
  default     = true
  
}

variable "point_in_time_recovery_enabled" {
  description = "point_in_time_recovery_enabled for postgresql backup configuration"
  type = bool
  
}

variable "deletion_protection" {
  description = "deletion_protection for postgresql"
  type = bool
  
}