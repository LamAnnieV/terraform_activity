#Terraform works across platforms
#Order does not matter

################################### A W S #################################
# configure aws provider 
provider "aws" {
  access_key = var.access_key  #enter your aws access_key
  secret_key = var.secret_key  #enter your aws secret_key
  region = var.region   #Availability Zone
  #profile = "Admin"
}

################################### I N S T A N C E #################################

#Resource Block to create an AWS instance
resource "aws_instance" "terraform_local_instance_name" {
  ami = var.ami                            #AMI ID for Ubuntu
  instance_type = var.instance_type
  #subnet_id = var.subnet_id   
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data = "${file(var.deploy_file_name)}"
  key_name = var.key_pair          # name of your SSH key pair
  associate_public_ip_address = true  # Enable Auto-assign public IP

  tags = {
    "Name" : var.aws_instance_name     #name of the instance in AWS
  }

}
################################### O U T P U T #################################
#Output Block
output "instance_ip" {            
  value = aws_instance.terraform_local_instance_name.public_ip
}
