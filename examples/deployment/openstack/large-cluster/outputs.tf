output "salt-master" {
  value = "${openstack_compute_instance_v2.salt-master.access_ip_v4}"
}
output "db-server" {
 value = "${openstack_compute_instance_v2.db-server.access_ip_v4}"
}
output "tracker" {
 value = "${openstack_compute_instance_v2.tracker.access_ip_v4}"
}
output "job-queue" {
 value = "${openstack_compute_instance_v2.job-queue.access_ip_v4}"
}
output "worker" {
 value = "${join(",",openstack_compute_instance_v2.worker.*.access_ip_v4)}"
}
