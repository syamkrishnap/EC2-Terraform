resource "aws_eip" "lb" {
  instance = "${aws_instance.vm-name.id}"
  vpc      = true

  tags {
    Name = "${var.INSTANCE_NAME}-eip"
  }


}
