module "google_sql_database_instance" {
  source = "git::https://github.com/cloudeq-EMU-ORG/ceq_tf_template_gcp_wafr_mysql?ref=11172d0"

  for_each = var.sql_db_instance
  name             = each.value.name
  region           = each.value.region
  project_id       = each.value.project_id
  database_version = each.value.database_version
  tier             = each.value.tier
  db_name          = each.value.db_name
  instance         = each.value.name
  username          = each.value.username
  password         = each.value.password
  deletion_protection = each.value.deletion_protection
  user_labels  = each.value.user_labels
  private_network      = module.google_compute_network[each.key].google_compute_network

}
  

module "google_compute_network" {
  source = "git::https://github.com/cloudeq-EMU-ORG/ceq_tf_template_gcp_vpc.git//postgresql_vpc?ref=293a84e"
  for_each = var.google_compute_network
  project                                 = each.value.project
  network_name                            = each.value.network_name
  auto_create_subnetworks                 = each.value.auto_create_subnetworks
  mtu                                     = each.value.mtu
  network_description                     = each.value.network_description
  routing_mode                            = each.value.routing_mode
  delete_default_routes_on_create         = each.value.delete_default_routes_on_create
  network_firewall_policy_enforcement_order = each.value.network_firewall_policy_enforcement_order
  enable_ula_internal_ipv6                = each.value.enable_ula_internal_ipv6
  internal_ipv6_range                     = each.value.internal_ipv6_range

  subnet_name                             = each.value.subnet_name
  subnet_ip_cidr_range                    = each.value.subnet_ip_cidr_range
  subnet_description                      = each.value.subnet_description
  region                                  = each.value.region
  private_ip_google_access                = each.value.private_ip_google_access
  private_ipv6_google_access              = each.value.private_ipv6_google_access
  secondary_ip_range_name                 = each.value.secondary_ip_range_name
  secondary_ip_cidr_range                 = each.value.secondary_ip_cidr_range

  log_aggregation_interval                = each.value.log_aggregation_interval
  log_flow_sampling                       = each.value.log_flow_sampling
  log_metadata                            = each.value.log_metadata

  timeouts_create                         = each.value.timeouts_create
  timeouts_delete                         = each.value.timeouts_create
  timeouts_update                         = each.value.timeouts_create
  purpose                                 = each.value.purpose
  address_type                            = each.value.address_type
}  



# module "postgress_sql" {
#   source               =  "git::https://github.com/cloudeq-EMU-ORG/ceq_tf_template_gcp_wafr_mysql?ref=02d93d6"
  
#   for_each             = var.google_postgresql

#   region               = each.value.region
#   project_id           = each.value.project_id
#   postgress_ins        = each.value.postgress_ins
#   database_version     = each.value.database_version
#   username             = each.value.username
#   disable_on_destroy   = each.value.disable_on_destroy
#   ipv4_enabled         = each.value.ipv4_enabled
#   db_password          = each.value.db_password
#   deletion_protection  = each.value.deletion_protection
#   db_tier              = each.value.db_tier
#   db_edition           = each.value.db_edition
#   db_aval_type         = each.value.db_aval_type
#   user_labels          = each.value.user_labels  
#   # private_network      = module.google_compute_network[each.key].google_compute_network
  


# }