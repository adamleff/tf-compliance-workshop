# Compliance Workshop Setup

## Things you'll need

 * a valid `delivery.license` file in this directory

## Running the thing

Assuming I want my automate hostname prefixed with `scale` and my AWS EC2 SSH keypair is named `mykeynamehere`:

```
export TF_VAR_prefix="scale"
export TF_VAR_aws_sshkey="mykeynamehere"
terraform plan     # make sure that the expected number of workstations are created, etc.
terraform apply
ruby ./parse_state.rb terraform.tfstate
```

## Variables

 * prefix (env var: TF_VAR_prefix): the prefix to be used in hostnames
    * example: if prefix is "chi", the automate server FQDN will be: `chi-compliance-workshop.chefdemo.net`
 * aws_sshkey (env var: TF_VAR_aws_sshkey): name of the EC2 ssh key to set up for access
 * contact_tag (env var: TF_VAR_contact_tag -- default: 'community'): the value to set for the X-Contact tag

## Automate Server

 * An automate server will be set up as `PREFIX-compliance-workshop.chefdemo.net`
 * Username: chef / Password: chef

## Workstations

The workstation setup assumes you're using playing cards to assign workstations to users.

In `workstations.tf`, add as many modules as you need to create the necessary number of workstations.

For example:

```
module "heart-workstations" {
  source = "./workstations"
  suit = "hearts"
  automate_fqdn = "${aws_route53_record.automate.name}"
  aws_sshkey = "${var.aws_sshkey}"
  contact_tag = "${var.contact_tag}"
}
```

Available parameters:

 * suit: string. Whatever you want it to be. Will be used in the output as well as the node name that's shown in the Visibility UI
 * count: number. Defaults to 13, which will give you 2-10, J, Q, K, A. Any number greater than 13 will still only create 13 workstations.
 * color: string. For classrooms larger than 52 where you have two decks of cards, you can set this to "orange", "blue", or "white" based on our current cards and generate more hostnames, such as "orange-3-of-hearts" or "blue-ace-of-spades"

