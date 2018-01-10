resource "ibm_compute_vm_instance" "vm_instances" {
    count=2
    hostname = "${var.vm-hostname}-${count.index}"
    domain = "${var.vm-domain}"
    os_reference_code = "${var.vm-os-reference-code}"
    datacenter = "${var.datacenter}"
    network_speed = 100
    hourly_billing = true
    private_network_only = false
    /* cores = ${var.vm-cores} */
    cores = 1
    /* memory = ${var.vm-memory} */
    memory = 1024
    disks = [25]
    #user_metadata = "{\"value\":\"newvalue\"}"
    local_disk = false
    public_vlan_id = 2200297
    private_vlan_id = 2190899
    private_security_group_ids = [241753,241755]
    public_security_group_ids = [241755]
    user_metadata = "${file("init.yml")}"
    #post_install_script_uri = "${var.vm-install-script}"
}

resource "ibm_lbaas" "lbaas" {
  name        = "ibmCloudLBS"
  description = "delete this plz"
  subnets     = [633872]

  protocols = [{
      frontend_protocol     = "TCP"
      frontend_port         = 80
      backend_protocol      = "TCP"
      backend_port          = 80
      load_balancing_method = "round_robin"
    },
  ]

  server_instances = [
    {
      "private_ip_address" = "${ibm_compute_vm_instance.vm_instances.0.ipv4_address_private}"
    },
    {
      "private_ip_address" = "${ibm_compute_vm_instance.vm_instances.1.ipv4_address_private}"
    },
  ]
}

