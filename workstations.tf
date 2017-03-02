module "heart-workstations" {
  source = "./workstations"
  suit = "hearts"
  color = "orange"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "diamonds-workstations" {
  source = "./workstations"
  suit = "diamonds"
  color = "orange"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "spades-workstations" {
  source = "./workstations"
  suit = "spades"
  color = "orange"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "clubs-workstations" {
  source = "./workstations"
  suit = "spades"
  color = "orange"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "blue-heart-workstations" {
  source = "./workstations"
  suit = "hearts"
  color = "blue"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "blue-diamonds-workstations" {
  source = "./workstations"
  suit = "diamonds"
  color = "blue"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "blue-spades-workstations" {
  source = "./workstations"
  suit = "spades"
  color = "blue"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "blue-clubs-workstations" {
  source = "./workstations"
  suit = "spades"
  color = "blue"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}
