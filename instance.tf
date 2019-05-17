data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_instance" "vm-name" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.devops-sg.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.devops.key_name}"

  # Create 20GB root disk
  root_block_device {
     volume_size = 20
  }

  tags {
    Name = "${var.INSTANCE_NAME}"
  }

}
