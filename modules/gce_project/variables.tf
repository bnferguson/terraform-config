variable "env" {}
variable "index" {}
variable "gce_project" {}

variable "gce_bastion_image" {}
variable "gce_nat_image" {}

variable "bastion_cloud_init" {}

variable "gke_master_username" {}
variable "gke_master_password" {}
variable "gke_initial_node_count" {
  type = "string"
  default = "3"
}
