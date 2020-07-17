provider "aws" {
  region                  = "us-east-1"
  profile                 = "default"
}
module "network" {
    source = "./network"
}
resource "aws_instance" "example"{
    ami = "ami-08f3d892de259504d"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${module.network.http_security}","${module.network.ssh_security}"]
    tags = { 
        Name = "Teste"
    }
}