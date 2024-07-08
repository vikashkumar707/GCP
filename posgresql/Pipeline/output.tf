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

output "main" {
  value =  {for key, value in module.postgress_sql :key => value.main }
  sensitive = true
}

output "user" {
  value =  {for key, value in module.postgress_sql :key => value.user }
  sensitive = true
}