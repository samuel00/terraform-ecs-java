variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "dev"
}

variable "app_name" {
  default = "transferencia"
}

variable "app_folder" {
  default = "../app"
}

variable "az_count" {
  default = 2
}

variable "ecs_task_execution_role_name" {
  default = "EcsTaskExecutionRole"
}

variable "fargate_cpu_app" {
  default = 2048
}

variable "fargate_memory_app" {
  default = 4096
}

variable "fargate_cpu" {
  default = 4096
}

variable "fargate_memory" {
  default = 8192
}

variable "fargate_cpu_db" {
  default = 2048
}

variable "fargate_memory_db" {
  default = 4096
}

variable "app_port" {
  default = 8080
}

variable "db_port" {
  default = 3306
}

variable "app_count" {
  default = 2
}

variable "health_check_path" {
  default = "/"
}

variable "ecs_auto_scale_role_name" {
  default = "EcsAutoScaleRole"
}

variable "ac_min_capacity" {
  default = 2
}

variable "ac_max_capacity" {
  default = 5
}

variable "cidrblock" {
  default = "10.1.0.0/16"
}

variable "log_retention" {
  default = 5
}

variable "db_name" {
  default = "mysqldb"
}

variable "db_image" {
  default = "samuelsantana/mysql:1.0"
}

variable "app_image" {
  default = "samuelsantana/transferencia-eletronica-docker:1.0"
}

variable "container_definitions_template" {
  default = "template-container-definition.json"
}

variable "network_mode" {
  default = "awsvpc"
}

variable "launch_type" {
  default = "FARGATE"
}