module "heart-workstations" {
  source = "./workstations"
  suit = "hearts"
#  color = "orange"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "diamonds-workstations" {
  source = "./workstations"
  suit = "diamonds"
#  color = "orange"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "spades-workstations" {
  source = "./workstations"
  suit = "spades"
#  color = "orange"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "clubs-workstations" {
  source = "./workstations"
  suit = "clubs"
#  color = "orange"
  count = 13
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}
