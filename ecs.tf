resource "aws_ecs_cluster" "this" {
  name = "${local.app_name}-cluster"
}

resource "aws_ecs_task_definition" "this" {
  family                   = "${local.app_name}-task-definition"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  requires_compatibilities = [var.launch_type]
  network_mode             = var.network_mode
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory

  container_definitions = templatefile("${path.module}/${var.env}/${var.container_definitions_template}", {
    app_image          = local.app_image
    app_name           = local.app_name
    container_name     = local.container_name
    app_port           = var.app_port
    db_image           = local.db_image
    db_name            = local.db_name
    db_container_name  = local.db_container_name
    db_port            = var.db_port
    fargate_cpu_db     = var.fargate_cpu_db
    fargate_memory_db  = var.fargate_memory_db
    fargate_cpu_app    = var.fargate_cpu_app
    fargate_memory_app = var.fargate_memory_app
    aws_region         = var.region
    env                = var.env == "prod" ? "production" : var.env
  })
}

resource "aws_ecs_service" "this" {
  name            = "${local.app_name}-service"
  task_definition = aws_ecs_task_definition.this.arn
  cluster         = aws_ecs_cluster.this.id
  desired_count   = var.app_count
  launch_type     = var.launch_type

  network_configuration {
    subnets          = aws_subnet.private.*.id
    security_groups  = [aws_security_group.ecs_tasks.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.this.id
    container_name   = local.container_name
    container_port   = var.app_port
  }

  depends_on = [aws_iam_role_policy_attachment.ecs_task_execution_role, aws_alb_listener.this]
}