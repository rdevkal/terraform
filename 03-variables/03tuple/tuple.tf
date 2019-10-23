variable "a" {
  type = "tuple"
  default = ["1", "2"]
}

resource "null_resource" "sample" {
  count = length(var.a)
  provisioner "local-exec" {
    command = "echo  ${element(var.a,count.index)}"
  }
}