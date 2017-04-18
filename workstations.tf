module "heart-workstations" {
  source = "./workstations"
  suit = "hearts"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "diamonds-workstations" {
  source = "./workstations"
  suit = "diamonds"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "spades-workstations" {
  source = "./workstations"
  suit = "spades"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "clubs-workstations" {
  source = "./workstations"
  suit = "clubs"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}
