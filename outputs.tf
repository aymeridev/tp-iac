output "container_name" {
  description = "nom du conteneur déployé"
  value       = docker_container.web.name
}

output "network_name" {
  description = "nom du réseau docker"
  value       = docker_network.app_network.name
}

output "website_url" {
  description = "URL du serveur web local"
  value       = "http://localhost:${var.external_port}"
}