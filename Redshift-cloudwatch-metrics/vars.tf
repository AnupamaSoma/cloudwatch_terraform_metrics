variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}
variable "evaluation_periods" {
  type  = number
}
variable "period" {
  type  = number
}
variable "emails" {
  type = list
}
variable "cpu_utilization_threshold" {
  type = number
}
variable "DatabaseConnections_threshold"{
 type = number
}
variable "HealthStatus_threshold"{
 type = number
}
variable "clusteridentifier" {
  type = list
}

