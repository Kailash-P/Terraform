output "result" {
  value = "${lower(var.environment_name)}${lower(var.resource_prefix)}${lower(var.resource_type)}${random_string.suffix.result}"
}

output "suffix" {
  value = ["${var.environment_name}${var.resource_prefix}${var.resource_type}${random_string.suffix.result}"]
}
