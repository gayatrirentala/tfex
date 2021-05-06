provider "aws"{
 region = "us-east-1"
}

module "my_vpc"{
source = "../modules/vpc"
vpc_id = "${module.my_vpc.vpc_id}"
vpc_cidr ="192.168.0.0/16"
tenancy = "default"
subnet_cidr ="192.168.1.0/24"

}

module "my_ec2"{
source = "../modules/ec2"
ec2_count = "1"
ami_id     = "ami-0d5eff06f840b45e9"
instance_type = "t2.micro"
subnet_id = "${module.my_vpc.subnet_id}"

}
