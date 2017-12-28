resource "ibm_compute_vm_instance" "twc_terraform_sample" {
    hostname = "${var.vm-hostname}"
    domain = "${var.vm-domain}"
    os_reference_code = "${var.vm-os-reference-code}"
    datacenter = "${var.datacenter}"
    network_speed = 10
    hourly_billing = true
    private_network_only = false
    cores = ${var.vm-cores}
    memory = ${var.vm-memory}
    disks = [25]
    user_metadata = "{\"value\":\"newvalue\"}"
    local_disk = false
    public_vlan_id = 2200297
    private_vlan_id = 2190899
    private_security_group_ids = [241753,241755]
    public_security_group_ids = [241749]
}
