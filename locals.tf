locals {
  app_name       = "${var.app_name}-${var.env}"
  container_name = "${local.app_name}-container"
  app_image      = var.app_image

  db_name           = var.db_name
  db_container_name = "${local.db_name}-container"
  db_image          = var.db_image

  autoscaling_resource_id = "service/${aws_ecs_cluster.this.name}/${aws_ecs_service.this.name}"

  tags = {
    Project   = local.app_name
    Env       = var.env
    ManagedBy = "Terraform"
    Owner     = "Samuel Santana"
  }
}