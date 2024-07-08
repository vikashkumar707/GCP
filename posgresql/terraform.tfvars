google_compute_network = {
                          "0" = {
                                  project                 = "ceq-devops-sandbox"
                                  network_name            = "vpc-postgresql"
                                  auto_create_subnetworks = true
                                  mtu                     = 1460
                                  network_description     = "network-postgresql"
                                  routing_mode            = "GLOBAL" 
                                  network_firewall_policy_enforcement_order = "BEFORE_CLASSIC_FIREWALL"
                                  delete_default_routes_on_create = false
                                  enable_ula_internal_ipv6 = false
                                  internal_ipv6_range  = null
                                  timeouts_create = "5m"  
                                  timeouts_delete = "5m" 
                                  timeouts_update = "5m"
                                  subnet_name     = "subnet-postgresql"
                                  subnet_ip_cidr_range   = "10.2.0.0/16"
                                  subnet_description   = "testing"
                                  region               = "us-central1"
                                  private_ip_google_access     = null
                                  private_ipv6_google_access   = null
                                  secondary_ip_range_name    = "secondary-range-update"
                                  secondary_ip_cidr_range = "192.168.10.0/24"
                                  log_aggregation_interval = "INTERVAL_10_MIN"
                                  log_flow_sampling        = "0.5"
                                  log_metadata             = "INCLUDE_ALL_METADATA"
                                  purpose                  = "VPC_PEERING"
                                  address_type             = "INTERNAL"
                                     

                              
                               } 

                      }     


google_postgresql = {
                   "0" = {
                        project_id           = "ceq-devops-sandbox"
                        region               = "us-central1"
                        postgress_ins        = "postgresssql-instance"
                        username             = "postguser"
                        db_password          = "rendev4321"
                        disable_on_destroy   = false
                        ipv4_enabled         = false
                        db_tier              = "db-g1-small"
                        db_edition           = "ENTERPRISE"
                        db_aval_type         = "REGIONAL"                        
                        deletion_protection  = false
                        transaction_log_retention_days  = 7
                        database_version = "POSTGRES_15"
                        user_labels  = {
                        
                          start_date         = "12-06-2024"
                          end_date           = "26-06-2024"
                          project_name       =  "gcp_devsecops_wafr_solutions"
                          department_name    = "devops"
                          application_name   = "ceq-devops-sandbox"
                          client_name        = "ceq_internal"
                          owner_name         = "vikashkumar"
                          sow_number         = "ceqsow24085ov"
                    }
                   }
}



