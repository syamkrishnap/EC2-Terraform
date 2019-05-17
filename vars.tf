variable "SOURCE_IP_1" {}
variable "SOURCE_IP_2" {}
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "INSTANCE_NAME" {}

variable "AWS_REGION" {}

variable "PATH_TO_PRIVATE_KEY" {
  default = "devops"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "devops.pub"
}
