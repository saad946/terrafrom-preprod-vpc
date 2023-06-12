variable "vpc_cidr_block" {
  type        = string
  description = "VPC's CIDR block"
}

variable "env" {
  type        = string
  description = "Environemnt where deployment will occur"
}

variable "region" {
  type        = string
  description = "Aurora RDS region"
}

variable "name" {
  type        = string
  description = "Environemnt where deployment will occur"
}


variable "public_subnets" {
  type        = list(string)
  description = "List of CIDR ranges for public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of CIDR ranges for private subnets"
}

variable "kubernetes_version" {
  type    = string
  default = "1.23"
}


variable "container_insights_log_group_retention_days" {
  type        = number
  description = "ContainerInsights Log Groups (cluster, application, platform) retention in days"
  default     = 3
}

variable "container_insights_metrics_log_group_retention_days" {
  type        = number
  description = "ContainerInsights Log Groups metrics(dataplane, host, logs, performance, prometheus) retention in days"
  default     = 1
}

variable "engine_version" {
  description = "Version of engine to be used"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the cluster"
  type        = list(string)
  default     = []
}

variable "inbound_security_groups" {
  description = "List of security group allowed to access the cluster"
  type        = list(string)
  default     = []
}


variable "multi-az-deployment" {
  description = "List of AZz"
  type        = bool
}

variable "monitoring_interval" {
  description = "Interval for RDS enhanced monitoring"
  type        = number
  default     = 0 # Set a default value or adjust according to your requirements
}


variable "instance_class" {
  description = "Instance type to use"
  type        = string
}

variable "backup_plan_schedule" {
  type        = string
  description = "A CRON expression specifying when AWS Backup initiates a backup job"
  default     = "cron(0 12 * * ? *)"
}


variable "aurora_backup_plan_schedule" {
  description = "Description of the aurora_backup_plan_schedule variable"
  type        = string
}


variable "backup_retention_period" {
  type        = number
  description = "The days to retain backups for aurora cluster"
  default     = "2"
}

variable "preferred_maintenance_window" {
  description = "The window to perform maintenance in. Malaysia Time (MYT), UTC +8"
  type        = string
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
}

variable "master_username" {
  description = "The master username for the database"
  type        = string
  default     = "postgres"
}

variable "account_id" {
  description = "The master username for the database"
  type        = string
}
variable "admin_sso_role_name" {
  description = "The master username for the database"
  type        = list(string)
}

variable "workers_roles" {
  type    = list(string)
  default = []
}

variable "role_groups_mapping" {
  type    = map(any)
  default = {}
}


variable "port" {
  description = "The port on which the DB accepts connections"
  type        = number
  default     = 5432
}


variable "instance_count" {
  type    = number
  default = "2"
}

variable "ecr_iam_principal" {
  type    = set(string)
  default = []
}

variable "readonly_external_aws_iam_principals" {
  type    = set(string)
  default = []
}

variable "ecr_repository" {
  type        = set(string)
  description = "Ecr repository name"
}

variable "pullthroughcache_repositories" {
  type        = set(string)
  description = "Repositories allowed to pull through cache"
  default     = []
}



