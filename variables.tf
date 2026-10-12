variable "container_name" {
  description = "conteneur web"
  type        = string
  default     = "tp-iac-nginx"

  validation {
    condition = can(regex("^[a-zA-Z0-9][a-zA-Z0-9_.-]*$",
    var.container_name))
    error_message = "le nom du conteneur contient des caractères non autorisés."
  }
}

variable "network_name" {
  description = "nom du réseau docker"
  type        = string
  default     = "network"
}

variable "external_port" {
  description = "port http exposé sur la machine locale"
  type        = number
  default     = 8080

  validation {
    condition     = var.external_port >= 1024 && var.external_port <= 65535
    error_message = "le port doit être compris entre 1024 et 65535"
  }
}