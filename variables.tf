variable "ssh_authorized_keys" {
  description = "SSH public key for instances. For example: ssh-rsa AAEAAAA....3R ssh-key-2024-09-03"
  type        = string
}

variable "compartment_id" {
  description = "The OCID of the compartment. Find it: Profile → Tenancy: youruser → Tenancy information → OCID https://cloud.oracle.com/tenancy"
  type        = string
}

variable "num_master_instances" {
  description = "Number of Dokploy master instances to deploy."
  type        = number
  default     = 1
}

variable "num_worker_instances" {
  description = "Number of Dokploy worker instances to deploy."
  type        = number
  default     = 1
}

variable "availability_domain_master" {
  description = "(Optional) Availability domain for dokploy-main instance. If not provided, instances will be distributed automatically across available domains. Find it Core Infrastructure → Compute → Instances → Availability domain (left menu). For example: WBJv:EU-FRANKFURT-1-AD-1"
  type        = string
  default     = null
}

variable "availability_domain_workers" {
  description = "(Optional) Availability domain for dokploy-worker instances. If not provided, instances will be distributed automatically across available domains. Find it Core Infrastructure → Compute → Instances → Availability domain (left menu). For example: WBJv:EU-FRANKFURT-1-AD-2"
  type        = string
  default     = null
}

variable "instance_shape" {
  description = "The shape of the instance. VM.Standard.A1.Flex is free tier eligible."
  type        = string
  default     = "VM.Standard.A1.Flex" # OCI Free
}
