module "heart-workstations" {
  source = "./workstations"
  suit = "hearts"
  color = "orange"
  count = 2
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}

module "diamonds-workstations" {
  source = "./workstations"
  suit = "diamonds"
  count = 2
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}
