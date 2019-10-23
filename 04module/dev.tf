module "SAMPLE" {
  source  = "./sample"
  MSG     = "${var.MSG}"
}

variable "MSG" {}

