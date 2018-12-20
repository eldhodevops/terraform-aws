# terraform-aws
terraform-aws
# terraform-aws
terraform-aws

The OS used is Ubuntu:

+++
$ cat /etc/os-release 
NAME="Ubuntu"
VERSION="18.04.1 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.1 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
+++

Steps to follow:

1:Install terrafom on your local machine:

wget https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip

2: unzip 

unzip terraform_0.11.10_linux_amd64.zip

3: sudo mv terraform /usr/local/bin/

4: terraform init (Output: Terraform has been successfully initialized!)

4.1: terraform --version 

5: Clone repository:
   git clone https://github.com/eldhodevops/terraform-aws.git

6: Edit main.tf file in the cloned repository for addyour profile after create and configureing profile using below steps

   If you have not created a user please follow the steps to create IAM user with accees previalges:
   
    Login to AWS console > Click on IAM > Add user > Create a user with programatic access with ec2full access ploicy and copy the access_key and secret_key and add it to main.tf file
    
 7: Create a profile in your local machine using  below step
 
The following example shows a credentials file with two profiles. The first is used when you run a CLI command with no profile, and the second is used when you run a CLI command with the --profile user1 parameter.
    Example: 
  ~/.aws/credentials   
 
 ```
[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

[user1]
aws_access_key_id=AKIAI44QH8DHBEXAMPLE
aws_secret_access_key=je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
 ```
    
 Each profile uses different credentials—perhaps from different IAM users—and can also use different regions and output formats:

~/.aws/config
```
[default]
region=us-west-2
output=json

[profile user1]
region=us-east-1
output=text   
 ```
7.1: add the profile name to main.tf file

 8: terraform plan
 
     Output will be as below:
     
     terraform plan
```
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + aws_instance.paloit
      id:                                    <computed>
      ami:                                   "ami-14c5486b"
      associate_public_ip_address:           <computed>
      availability_zone:                     <computed>
      ebs_block_device.#:                    <computed>
      ephemeral_block_device.#:              <computed>
      get_password_data:                     "false"
      instance_state:                        <computed>
      instance_type:                         "t2.micro"
      ipv6_address_count:                    <computed>
      ipv6_addresses.#:                      <computed>
      key_name:                              <computed>
      network_interface.#:                   <computed>
      network_interface_id:                  <computed>
      password_data:                         <computed>
      placement_group:                       <computed>
      primary_network_interface_id:          <computed>
      private_dns:                           <computed>
      private_ip:                            <computed>
      public_dns:                            <computed>
      public_ip:                             <computed>
      root_block_device.#:                   <computed>
      security_groups.#:                     "1"
      security_groups.3262076447:            "web-node"
      source_dest_check:                     "true"
      subnet_id:                             <computed>
      tags.%:                                "1"
      tags.Name:                             "devops-test"
      tenancy:                               <computed>
      volume_tags.%:                         <computed>
      vpc_security_group_ids.#:              <computed>

  + aws_security_group.web-node
      id:                                    <computed>
      arn:                                   <computed>
      description:                           "Web Security Group"
      egress.#:                              "1"
      egress.482069346.cidr_blocks.#:        "1"
      egress.482069346.cidr_blocks.0:        "0.0.0.0/0"
      egress.482069346.description:          ""
      egress.482069346.from_port:            "0"
      egress.482069346.ipv6_cidr_blocks.#:   "0"
      egress.482069346.prefix_list_ids.#:    "0"
      egress.482069346.protocol:             "-1"
      egress.482069346.security_groups.#:    "0"
      egress.482069346.self:                 "false"
      egress.482069346.to_port:              "0"
      ingress.#:                             "2"
      ingress.2214680975.cidr_blocks.#:      "1"
      ingress.2214680975.cidr_blocks.0:      "0.0.0.0/0"
      ingress.2214680975.description:        ""
      ingress.2214680975.from_port:          "80"
      ingress.2214680975.ipv6_cidr_blocks.#: "0"
      ingress.2214680975.protocol:           "tcp"
      ingress.2214680975.security_groups.#:  "0"
      ingress.2214680975.self:               "false"
      ingress.2214680975.to_port:            "80"
      ingress.2541437006.cidr_blocks.#:      "1"
      ingress.2541437006.cidr_blocks.0:      "0.0.0.0/0"
      ingress.2541437006.description:        ""
      ingress.2541437006.from_port:          "22"
      ingress.2541437006.ipv6_cidr_blocks.#: "0"
      ingress.2541437006.protocol:           "tcp"
      ingress.2541437006.security_groups.#:  "0"
      ingress.2541437006.self:               "false"
      ingress.2541437006.to_port:            "22"
      name:                                  "web-node"
      owner_id:                              <computed>
      revoke_rules_on_delete:                "false"
      vpc_id:                                <computed>


Plan: 2 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------
```

9: terraform apply
   
```
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
Outputs:
Availability Zone = us-east-1c
Security Group = [
    web-node
]
Your Private IP = 172.31.86.70
Your Public DNS = ec2-18-212-200-74.compute-1.amazonaws.com
Your Public IP = 18.212.200.74
```

