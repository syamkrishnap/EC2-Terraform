resource "aws_key_pair" "devops" {
  key_name   = "devops"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
