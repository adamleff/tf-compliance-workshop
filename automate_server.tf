variable "prefix" {
  type = "string"
}

variable "aws_sshkey" {
  type = "string"
}

variable "contact_tag" {
  type = "string"
  default = "community"
}

provider "aws" {
  region     = "${var.region}"
}

resource "null_resource" "delivery_client_key" {
  provisioner "local-exec" {
    command = "openssl genrsa -out delivery.pem 2048"
  }
}

data "aws_route53_zone" "chefdemo" {
  name = "chefdemo.net."
}

resource "aws_instance" "automate" {
    ami = "ami-d2c924b2"
    key_name = "${var.aws_sshkey}"
    instance_type = "m4.4xlarge"
    vpc_security_group_ids = ["sg-d36252b4"]
    root_block_device {
      volume_size = 60
    }
    tags {
        X-Dept = "Eng"
        X-Contact = "${var.contact_tag}"
        Name = "${var.prefix}-compliance-workshop-automate"
    }
    depends_on = ["null_resource.delivery_client_key"]

    connection {
      type = "ssh"
      user = "centos"
    }

    provisioner "file" {
      source = "delivery.pem"
      destination = "/tmp/delivery.pem"
    }

    provisioner "file" {
      source = "./delivery.license"
      destination = "/tmp/delivery.license"
    }

    provisioner "remote-exec" {
      inline = [
        "curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P automate",
        "sudo automate-ctl setup --license /tmp/delivery.license --fqdn ${var.prefix}-compliance-workshop.${data.aws_route53_zone.chefdemo.name} --key /tmp/delivery.pem --server-url https://fake-chef-server.chefdemo.net/organizations/chef --enterprise chef --no-build-node --configure",
        "sudo automate-ctl create-user chef chef --password chef --roles admin"
      ]
    }
}

resource "aws_route53_record" "automate" {
  zone_id = "${data.aws_route53_zone.chefdemo.zone_id}"
  name = "${var.prefix}-compliance-workshop.${data.aws_route53_zone.chefdemo.name}"
  type = "A"
  ttl = "300"
  records = ["${aws_instance.automate.public_ip}"]
}
