provider "aws" {
  region     = "us-east-1"
}
  resource "aws_instance" "ec2_example" {
  ami           = "ami-0715c1897453cabd1"
  instance_type =  "t2.micro"
  tags = {
    Name = "MCIT"
  }
}
  # The following null resource will print message "Hello World"
 resource "null_resource" "null_resource_simple" {
  triggers = {
    id = aws_instance.ec2_example.id
  }
  provisioner "local-exec" {
    command = <<-EOT
      touch hello-world.txt
    EOT
  }
}
