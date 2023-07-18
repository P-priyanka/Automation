resource "null_resource" "vmlinux-n01591501-provisioner" {
    for_each = local.instances

    provisioner "remote-exec" {
        inline = [ "echo Hostname: $(hostname)" ]
    }

    connection {
      type = "ssh"
      user = "priyanka_n01591501"
      host = azurerm_linux_virtual_machine.vmlinux[each.key].public_ip_address
      private_key = file("C:\\Users\\Admin\\.ssh\\id_rsa")
    }

    depends_on = [ azurerm_linux_virtual_machine.vmlinux ]
}