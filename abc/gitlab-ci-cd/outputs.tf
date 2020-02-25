#
# Outputs generated by main.tf
#
# These are needed to log into the ECS instance main.tf creates, as well
# as to set up GitLab through the GitLab web interface
#

#
# SSH Key for login to Sonar and GitLab instances
#
output "ssh_key_name" {
  description = "SSH key for instance login (all instances)"
  value       = "${var.ssh_key_name}.pem"
}

#
# URLs for Sonar and GitLab instances
#
output "gitlab_url" {
  description = "GitLab URL"
  value       = "${alicloud_dns_record.gitlab-dns.host_record}.${alicloud_dns_record.gitlab-dns.name}"
}

output "sonar_url" {
  description = "SonarQube URL"
  value       = "${alicloud_dns_record.sonar-dns.host_record}.${alicloud_dns_record.sonar-dns.name}"
}

#
# Gitlab runner public IP (will need this to log in and complete gitlab runner
# registration process)
#
output "gitlab_runner_ip" {
  description = "GitLab runner IP address"
  value = "${alicloud_instance.cicd-demo-gitlab-runner-ecs.public_ip}"
}

#
# SonarQube Configuration
#

# Raw domain (without prefixes such as 'sonar.' or 'gitlab.')
output "sonarqube_domain" {
  description = "Root domain without any subdomains such as 'sonar.' or 'gitlab.'"
  value = "sonar.${var.domain}"
}

# Database username
output "sonarqube_db_username" {
  description = "Database username for SonarQube's PostgreSQL database"
  value = "${var.sonarqube_db_username}"
}

# Database password
output "sonarqube_db_password" {
  description = "Database password for SonarQube's PostgreSQL database"
  value = "${var.sonarqube_db_password}"
}

# Database connection string
output "sonarqube_db_connection" {
  description = "Database connection string for SonarQube database"
  value = "${alicloud_db_instance.sonarqube_postgres_db_instance.connection_string}"
}

#
# OSS Bucket Information
#
output "gitlab_bucket_name" {
  description = "Name of GitLab backup OSS bucket"
  value = "${alicloud_oss_bucket.gitlab-oss-bucket.id}"
}

output "gitlab_bucket_endpoint" {
  description = "Endpoint URL for connecting to GitLab OSS bucket"
  value = "${alicloud_oss_bucket.gitlab-oss-bucket.extranet_endpoint}"
}

#
# DirectMail DNS Config
#
output "directmail_email" {
  description = "DirectMail SMTP username"
  value = "${var.directmail_email}"
}

output "directmail_url" {
  description = "Mail URL for DirectMail"
  value = "${var.dm_spf_host_record}.${var.domain}"
}

output "email_address" {
  description = "Email address (contact point) for LetsEncrypt certificates"
  value = "${var.email_address}"
}

output "directmail_smtp_address" {
  description = "SMTP endpoint from DirectMail console"
  value = "${var.directmail_smtp_address}"
}

