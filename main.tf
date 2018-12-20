provider "aws" {
 region = "us-east-1"
 access_key = "provide your accesskey"
 secret_key = "provide your secretkey"
}
resource "aws_security_group" "web-node" {
        name = "web-node"
        description = "Web Security Group"

        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }
}
resource "aws_instance" "paloit" {
  ami = "ami-14c5486b"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.web-node.name}"]
           tags {
                 Name = "devops-test"
           }
}
output "Your Public IP" {
  value = "${aws_instance.paloit.public_ip}"}
output "Availability Zone" {
  value = "${aws_instance.paloit.availability_zone}"}
output "Security Group" {
  value = "${aws_instance.paloit.security_groups}"}
output "Your Private IP" {
  value = "${aws_instance.paloit.private_ip}"
}
output "Your Public DNS" {
  value = "${aws_instance.paloit.public_dns}"
}
