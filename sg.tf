resource "aws_security_group" "devops-sg" {
  vpc_id = "${aws_vpc.main.id}"
  name = "devops-sg"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${var.SOURCE_IP_1}", "${var.SOURCE_IP_2}"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

tags {
    Name = "${var.INSTANCE_NAME}-sg"
  }
}
