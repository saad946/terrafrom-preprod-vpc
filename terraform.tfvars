vpc_cidr_block               = "10.0.0.0/16"
region                       = "ap-southeast-1"
env                          = "preprod"
name                         = "apps"
public_subnets               = ["10.0.64.0/19", "10.0.96.0/19"]
private_subnets              = ["10.0.32.0/19", "10.0.0.0/19"]
kubernetes_version           = "1.24"
instance_class               = "db.t4g.medium"
auto_minor_version_upgrade   = true
multi-az-deployment          = true
engine_version               = "13.8"
preferred_maintenance_window = "mon:18:00-mon:18:30"
aurora_backup_plan_schedule  = "cron(0 */6 * * ? *)"
account_id                   = "982291412478"
admin_sso_role_name          = ["arn:aws:iam::982291412478:role/eksClusterRole"]
ecr_repository               = ["project/microservice-template"]
pullthroughcache_repositories = [
  "ackstorm/checkov",
  "aws-dynamodb-local/aws-dynamodb-local",
  "aws-observability/aws-for-fluent-bit",
  "cloudwatch-agent/cloudwatch-agent",
  "docker/library/postgres",
  "docker/library/node",
  "ews-network/amazoncorretto",
  "ews-network/confluentinc/cp-schema-registry",
  "ews-network/confluentinc/cp-server",
  "ews-network/confluentinc/cp-zookeeper",
  "lambda/nodejs",
  "localstack/localstack",
  "ubuntu/postgres",
  "bitnami/blackbox-exporter"
]