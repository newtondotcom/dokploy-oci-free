# Instance config
locals {
  # Oracle Cloud Free Tier limits
  max_ocpus_total      = 4
  max_memory_gbs_total = 24

  instance_config = {
    is_pv_encryption_in_transit_enabled = true
    ssh_authorized_keys                 = var.ssh_authorized_keys
    shape                               = var.instance_shape
    shape_config = {
      memory_in_gbs = floor(local.max_memory_gbs_total / (var.num_worker_instances + var.num_master_instances))
      ocpus         = floor(local.max_ocpus_total / (var.num_worker_instances + var.num_master_instances))
    }
    source_details = {
      source_id               = data.oci_core_images.ubuntu_images.images[0].id
      source_type             = "image"
      boot_volume_size_in_gbs = floor(200 / var.num_worker_instances)
    }
    availability_config = {
      recovery_action = "RESTORE_INSTANCE"
    }
    instance_options = {
      are_legacy_imds_endpoints_disabled = false
    }
  }
}
