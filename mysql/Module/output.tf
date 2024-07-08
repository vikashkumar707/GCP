output "charset" {
  description = "returns a string"
  value       = google_sql_database.this.charset
}

output "collation" {
  description = "returns a string"
  value       = google_sql_database.this.collation
}

output "id" {
  description = "returns a string"
  value       = google_sql_database.this.id
}

output "ip_address" {
  description = "returns a list of object"
  value       = google_sql_database_instance.this.ip_address
}

output "this" {
  value = google_sql_database_instance.this
}


# output "main" {
#   value = google_sql_database_instance.main
# }

# output "user" {
#   value = google_sql_user.user
# }