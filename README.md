tf-compliance-workshop is a provisioner for AWS that uses Terraform for compliance workshops. It spins up one Automate server and the requisite number of workstations using the playing card system. It assumes you have terraform installed, your AWS ssh keys and secret keys, AWS CLI setup, etc. 

# Quickstart

1. `git clone` the repo.
1. place a valid `delivery.license` file in this directory
1. Update .gitignore with these changes:

        *.tfvars
        *.tfstate*
        .DS_Store
        !example.tfvars
        !example_secrets.tfvars
        *.keys
        *.license
        *.creds
        vendored-cookbooks/**
        .chef/delivery-validator.pem
        .chef/delivery-validator.pub

1. Create a terraform.tfvars file and include your variables there. See the included example.tfvars file and make a copy of it and call it terraform.tfvars
2. Make sure the workstations.tf file is correct for your needs. The one in this repo will make 52 workstations.
3. Run `terraform plan`
4. Run `terraform apply`
5. Run ruby ./parse-state.rb terraform.tfstate

# UPDATE THE Variables in the terraform.tfvars

- aws_sshkey="your_aws_keypair_name"
This variable refers to your AWS keypair name. If you need to setup a keypair, check out http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html

- prefix="your_workshop_name"
This variable is where you will specify the prefix, so if the prefix is "chi", the automate server FQDN will be: `chi-compliance-workshop.chefdemo.net

- region - This project works only in us-west-2 at this time. The region name where your aws instances will live.

## VPCs, Security Groups, and Route Tables
This project uses already created VPCs, security_groups, and route tables.  Here are more resources in case you are curious.

## 

terraform plan     # make sure that the expected number of workstations are created, etc.
terraform apply
ruby ./parse-state.rb terraform.tfstate
```

## Variables

 * prefix
    * example: if prefix is "chi", the automate server FQDN will be: `chi-compliance-workshop.chefdemo.net`
 * aws_sshkey: name of the EC2 ssh key to set up for access
 * contact_tag default: 'community'): the value to set for the X-Contact tag

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
