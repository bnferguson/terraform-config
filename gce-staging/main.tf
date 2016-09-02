module "gce_project_1" {
  source = "../modules/gce_project"

  env = "${var.env}"
  index = "1"

  gce_project = "travis-staging-1"
  gce_bastion_image = "${var.gce_bastion_image}"
  gce_nat_image = "${var.gce_nat_image}"
  gke_master_username = "${var.gke_master_username}"
  gke_master_password = "${var.gke_master_password}"

  bastion_cloud_init = "${data.template_file.bastion_cloud_init.rendered}"
}
