#
# Outputs generated by main.tf
#
# These are needed to log into the ECS instance main.tf creates, as well
# as to set up ownCloud through the ownCloud web interface
#
output "ec2_username" {
  description = "Username for instance login"
  value       = "ubuntu"
}

output "ssh_key_name" {
  description = "SSH key for instance login (all instances)"
  value       = "${var.ssh_key_name}"
}

output "ec2_ip" {
  description = "Public IP address of EC2 instance"
  value       = "${aws_instance.owncloud-instance.public_ip}"
}

output "db_name" {
  description = "Name of the database table (needed by ownCloud)"
  value       = "${var.db_name}"
}

output "db_username" {
  description = "Name of the database username (needed by ownCloud)"
  value       = "${var.db_username}"
}

output "db_password" {
  description = "Database password (needed by ownCloud)"
  value       = "${var.db_password}"
}

output "db_connection_string" {
  description = "Database connection string (needed by ownCloud)"
  value = "${aws_db_instance.owncloud-db-instance.endpoint}"
 }