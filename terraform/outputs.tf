output "external_ip_address_app" {
  value = yandex_compute_instance.app[*].network_interface.0.nat_ip_address
}

output "internal_ip_address_app" {
  value = yandex_compute_instance.app[*].network_interface.0.ip_address
}
output "url_app" {
  value = [
    "http://${yandex_compute_instance.app[0].network_interface.0.nat_ip_address}:9292",
    "http://${yandex_compute_instance.app[1].network_interface.0.nat_ip_address}:9292"
  ]
}

#output "lb_app" {
#  value = "http://${yandex_lb_network_load_balancer.reddit-lb.listener.external_address_spec.address}:9292"
#}
