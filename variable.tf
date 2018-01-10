variable "softlayer_username" {
  description = "Your IBM Cloud Infrastructure (SoftLayer) user name."
}
variable "softlayer_api_key" {
  description = "Your IBM Cloud Infrastructure (SoftLayer) API key."
}

provider "ibm" {
  softlayer_username = "${var.softlayer_username}"
  softlayer_api_key = "${var.softlayer_api_key}"
}

variable "datacenter" {
  default = "hkg02"
  description = "The data center for the local load balancer. You can run bluemix cs locations to see a list of all data centers in your region."
}

variable "vm-hostname" {
  default = "virtual-guest"
  description = "Hostname for the computing instance."
}

variable "vm-domain" {
  default = "example.com"
  description = "Domain for the computing instance."
}

variable "vm-cores" {
  default = 1
  description = "The number of CPU cores to allocate."
}

variable "vm-memory" {
  default = 1024
  description = "The amount of memory to allocate, expressed in MBs."
}

variable "vm-os-reference-code" {
  default = "CENTOS_7"
  description = "The operating system reference code that is used to provision the computing instance."
}
