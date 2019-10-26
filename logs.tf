resource "aws_cloudwatch_log_group" "app" {
  name              = "/ecs/${local.app_name}"
  retention_in_days = var.log_retention

  tags = merge({ Name = "${local.app_name}-log-group" }, local.tags)
}

resource "aws_cloudwatch_log_group" "db" {
  name              = "/ecs/${local.db_name}"
  retention_in_days = var.log_retention

  tags = merge({ Name = "${local.db_name}-log-group" }, local.tags)
}
