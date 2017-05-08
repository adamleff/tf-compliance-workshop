variable "suit" {}
variable "count" {
  default = "13"
}
variable "color" {
  default = ""
}
variable "automate_fqdn" {}
variable "contact_tag" {}
variable "aws_sshkey" {}

resource "aws_instance" "workstation-numbered" {
  count = "${var.count >= 9 ? "9" : "${var.count}"}"
  ami = "ami-7173fd11"
  key_name = "${var.aws_sshkey}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-d36252b4"]
  tags {
      X-Dept = "Eng"
      X-Contact = "${var.contact_tag}"
      Name = "${var.color == "" ? 
        "compliance-workstation-${count.index + 2}-of-${var.suit}" :
        "compliance-workstation-${var.color}-${count.index + 2}-of-${var.suit}"
      }"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo usermod --password '$1$odEJTw66$qVh4ZgjC9t2Aq0h3CUxX20' chef",
      "sudo mkdir -p /home/chef/.chef",
      "sudo sed 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config > /tmp/sshd_config",
      "sudo cp /tmp/sshd_config /etc/ssh/sshd_config",
      "sudo rm /tmp/sshd_config",
      "sudo service sshd restart"
    ]
  }

  provisioner "file" {
    destination = "/tmp/config.rb"
    #content = "${data.template_file.chef_config_rb.rendered}"
    content = <<EOL
node_name "${var.color == "" ? "${count.index + 2}-of-${var.suit}" : "${var.color}-${count.index + 2}-of-${var.suit}"}"
data_collector.server_url "https://${var.automate_fqdn}/data-collector/v0/"
data_collector.token "93a49a4f2482c64126f7b6015e6b0f30284287ee4054ff8807fb63d9cbd1c506"
ssl_verify_mode :verify_none
verify_api_cert false
EOL
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cp /tmp/config.rb /home/chef/.chef/config.rb",
      "sudo chown -R chef /home/chef",
      "sudo -i -u chef chef-client -z"
    ]
  }

  connection {
    type = "ssh"
    user = "centos"
  }
}

resource "aws_instance" "workstation-jack" {
  count = "${var.count >= 10 ? "1" : "0"}"
  ami = "ami-7173fd11"
  key_name = "${var.aws_sshkey}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-d36252b4"]
  tags {
      X-Dept = "Eng"
      X-Contact = "${var.contact_tag}"
      Name = "${var.color == "" ? 
        "compliance-workstation-jack-of-${var.suit}" :
        "compliance-workstation-${var.color}-jack-of-${var.suit}"
      }"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo usermod --password '$1$odEJTw66$qVh4ZgjC9t2Aq0h3CUxX20' chef",
      "sudo mkdir -p /home/chef/.chef",
      "sudo sed 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config > /tmp/sshd_config",
      "sudo cp /tmp/sshd_config /etc/ssh/sshd_config",
      "sudo rm /tmp/sshd_config",
      "sudo service sshd restart"
    ]
  }

  provisioner "file" {
    destination = "/tmp/config.rb"
    #content = "${data.template_file.chef_config_rb.rendered}"
    content = <<EOL
node_name "${var.color == "" ? "jack-of-${var.suit}" : "${var.color}-jack-of-${var.suit}"}"
data_collector.server_url "https://${var.automate_fqdn}/data-collector/v0/"
data_collector.token "93a49a4f2482c64126f7b6015e6b0f30284287ee4054ff8807fb63d9cbd1c506"
ssl_verify_mode :verify_none
verify_api_cert false
EOL
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cp /tmp/config.rb /home/chef/.chef/config.rb",
      "sudo chown -R chef /home/chef",
      "sudo -i -u chef chef-client -z"
    ]
  }

  connection {
    type = "ssh"
    user = "centos"
  }
}

resource "aws_instance" "workstation-queen" {
  count = "${var.count >= 11 ? "1" : "0"}"
  ami = "ami-7173fd11"
  key_name = "${var.aws_sshkey}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-d36252b4"]
  tags {
      X-Dept = "Eng"
      X-Contact = "${var.contact_tag}"
      Name = "${var.color == "" ? 
        "compliance-workstation-queen-of-${var.suit}" :
        "compliance-workstation-${var.color}-queen-of-${var.suit}"
      }"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo usermod --password '$1$odEJTw66$qVh4ZgjC9t2Aq0h3CUxX20' chef",
      "sudo mkdir -p /home/chef/.chef",
      "sudo sed 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config > /tmp/sshd_config",
      "sudo cp /tmp/sshd_config /etc/ssh/sshd_config",
      "sudo rm /tmp/sshd_config",
      "sudo service sshd restart"
    ]
  }

  provisioner "file" {
    destination = "/tmp/config.rb"
    #content = "${data.template_file.chef_config_rb.rendered}"
    content = <<EOL
node_name "${var.color == "" ? "queen-of-${var.suit}" : "${var.color}-queen-of-${var.suit}"}"
data_collector.server_url "https://${var.automate_fqdn}/data-collector/v0/"
data_collector.token "93a49a4f2482c64126f7b6015e6b0f30284287ee4054ff8807fb63d9cbd1c506"
ssl_verify_mode :verify_none
verify_api_cert false
EOL
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cp /tmp/config.rb /home/chef/.chef/config.rb",
      "sudo chown -R chef /home/chef",
      "sudo -i -u chef chef-client -z"
    ]
  }

  connection {
    type = "ssh"
    user = "centos"
  }
}

resource "aws_instance" "workstation-king" {
  count = "${var.count >= 12 ? "1" : "0"}"
  ami = "ami-7173fd11"
  key_name = "${var.aws_sshkey}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-d36252b4"]
  tags {
      X-Dept = "Eng"
      X-Contact = "${var.contact_tag}"
      Name = "${var.color == "" ? 
        "compliance-workstation-king-of-${var.suit}" :
        "compliance-workstation-${var.color}-king-of-${var.suit}"
      }"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo usermod --password '$1$odEJTw66$qVh4ZgjC9t2Aq0h3CUxX20' chef",
      "sudo mkdir -p /home/chef/.chef",
      "sudo sed 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config > /tmp/sshd_config",
      "sudo cp /tmp/sshd_config /etc/ssh/sshd_config",
      "sudo rm /tmp/sshd_config",
      "sudo service sshd restart"
    ]
  }

  provisioner "file" {
    destination = "/tmp/config.rb"
    #content = "${data.template_file.chef_config_rb.rendered}"
    content = <<EOL
node_name "${var.color == "" ? "king-of-${var.suit}" : "${var.color}-king-of-${var.suit}"}"
data_collector.server_url "https://${var.automate_fqdn}/data-collector/v0/"
data_collector.token "93a49a4f2482c64126f7b6015e6b0f30284287ee4054ff8807fb63d9cbd1c506"
ssl_verify_mode :verify_none
verify_api_cert false
EOL
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cp /tmp/config.rb /home/chef/.chef/config.rb",
      "sudo chown -R chef /home/chef",
      "sudo -i -u chef chef-client -z"
    ]
  }

  connection {
    type = "ssh"
    user = "centos"
  }
}

resource "aws_instance" "workstation-ace" {
  count = "${var.count >= 13 ? "1" : "0"}"
  ami = "ami-7173fd11"
  key_name = "${var.aws_sshkey}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-d36252b4"]
  tags {
      X-Dept = "Eng"
      X-Contact = "${var.contact_tag}"
      Name = "${var.color == "" ? 
        "compliance-workstation-ace-of-${var.suit}" :
        "compliance-workstation-${var.color}-ace-of-${var.suit}"
      }"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo usermod --password '$1$odEJTw66$qVh4ZgjC9t2Aq0h3CUxX20' chef",
      "sudo mkdir -p /home/chef/.chef",
      "sudo sed 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config > /tmp/sshd_config",
      "sudo cp /tmp/sshd_config /etc/ssh/sshd_config",
      "sudo rm /tmp/sshd_config",
      "sudo service sshd restart"
    ]
  }

  provisioner "file" {
    destination = "/tmp/config.rb"
    #content = "${data.template_file.chef_config_rb.rendered}"
    content = <<EOL
node_name "${var.color == "" ? "ace-of-${var.suit}" : "${var.color}-ace-of-${var.suit}"}"
data_collector.server_url "https://${var.automate_fqdn}/data-collector/v0/"
data_collector.token "93a49a4f2482c64126f7b6015e6b0f30284287ee4054ff8807fb63d9cbd1c506"
ssl_verify_mode :verify_none
verify_api_cert false
EOL
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cp /tmp/config.rb /home/chef/.chef/config.rb",
      "sudo chown -R chef /home/chef",
      "sudo -i -u chef chef-client -z"
    ]
  }

  connection {
    type = "ssh"
    user = "centos"
  }
}

