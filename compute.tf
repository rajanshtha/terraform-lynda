data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "ec2-instance" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  subnet_id = "${aws_subnet.subnet2.id}"

  tags {
    Name = "identifiertag"
  }
}
