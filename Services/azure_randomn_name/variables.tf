# Environment Name
variable "environment_name" {
    description="Environment Name"
    default="azure-rm"
}

# Resource Prefix
variable "resource_prefix" {
    description="Resource Prefix",
    default="test"
}

# Resource Type
variable "resource_type" {
    description="Resource Type",
    default="sg"
}

# Suffix Length

variable "suffix_length" {
    description="Suffix Length"
    default="2"
}

