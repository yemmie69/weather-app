
provider "aws" {
  region = "eu-west-1"
}


module "my_vpc" {
  source = "../modules/vpc"
  vpc_cidr = "151.230.0.0/16"
  tenancy = "default"
  vpc_id = "${module.my_vpc.vpc_id}"
subnet_cidr = "151.230.1.1/24"
  
}

module "my_ec2" {
  source = "../modules/ec2"
  ec2_count = "1"
  instance_type = "t2.micro"
  subnet_id = "${module.my_vpc.subnet_id}"
  
}
