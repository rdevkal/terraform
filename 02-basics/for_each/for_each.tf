resource "null_resource" "dummny" {
  for_each = {
    a_group = "eastus"
    another_group = "westus2"
  }
  provisioner "local-exec" {
    command = "echo ${each.key}"
  }
}