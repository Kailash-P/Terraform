# Generates a randomn number for suffix
resource "random_string" "suffix" {
  length  = "${var.suffix_length}"
  upper   = false
  lower   = false
  number  = true
  special = false
}