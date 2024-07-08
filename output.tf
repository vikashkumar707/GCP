output "charset" {
  description = "returns a string"
  value = { for k, v in module.google_sql_database_instance : k => v.charset }
  
}

output "collation" {
  description = "returns a string"
  value = { for k, v in module.google_sql_database_instance : k => v.collation }
}

output "id" {
  description = "returns a string"
  value  = { for k, v in module.google_sql_database_instance : k => v.id }
}

output "ip_address" {
  value  = { for k, v in module.google_sql_database_instance : k => v.ip_address }
}

output "this" {
  value = { for k, v in module.google_sql_database_instance : k => v.this }
  sensitive = true
}

output "google_compute_network" {
  value = {for key, value in module.google_compute_network :key => value.google_compute_network }
}

output "vpc_networkname" {
  value ={for key, value in module.google_compute_network :key => value.vpc_networkname }
}

output "custom_subnetname" {
  value = {for key, value in module.google_compute_network :key => value.custom_subnetname }
}

output "custom_subnet" {
  value = {for key, value in module.google_compute_network :key => value.custom_subnet }
}

# output "google_compute_network" {
#   value = {for key, value in module.google_compute_network :key => value.google_compute_network }
# }

# output "vpc_networkname" {
#   value ={for key, value in module.google_compute_network :key => value.vpc_networkname }
# }

# output "custom_subnetname" {
#   value = {for key, value in module.google_compute_network :key => value.custom_subnetname }
# }

# output "custom_subnet" {
#   value = {for key, value in module.google_compute_network :key => value.custom_subnet }
# }

# output "main" {
#   value =  {for key, value in module.postgress_sql :key => value.main }
#   sensitive = true
# }

# output "user" {
#   value =  {for key, value in module.postgress_sql :key => value.user }
#   sensitive = true
# }