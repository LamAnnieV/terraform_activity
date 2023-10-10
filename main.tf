#Terraform works across platforms
#Order does not matter

################################### A W S #################################
# configure aws provider (provider block: 
provider "aws" {
  access_key = ""  #enter your aws access_key
  secret_key = ""  #enter your aws secret_key
  region = "us-east-1"   #Availability Zone
  #profile = "Admin"
}

################################### I N S T A N C E #################################

# create instance  #Resource Block to create an AWS instance
resource "aws_instance" "terraform_local_instance_name" {                  
  ami = "ami-08c40ec9ead489470"                            #AMI ID for Ubuntu
  instance_type = "t2.micro"
  subnet_id = ["subnet-05eec17a242af87d3"]   
  vpc_security_group_ids = ["sg-0b8f86cae4c1dd5ce"]   
  user_data = "${file("deploy.sh")}"   

  tags = {
    "Name" : "terraform_activity"     #name of the instance in AWS
  }

}

################################### O U T P U T #################################
#Output Block
output "instance_ip" {            
  value = aws_instance.web_server01.public_ip
}
