# Provider Block
provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "ec2_example" {
  ami           = "admin-terraform-aws"
  instance_type =  "t2.micro"
  tags = {
    Name = "MCIT"
  }
}


# This null_resource will be executed everytime because of id = time().
resource "null_resource" "null_resource_simple" {
  
  # Look carefully in the trigger we have assigned time() which we change value every time you run $terraform apply command.
  triggers = {
    id = file()
  }

  provisioner "local-exec" {
    command = "echo Hello World"
  }
} 
