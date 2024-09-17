# Specify the AWS provider and region
provider "aws" {
  region = "ap-south-1"  # Specify the AWS region where resources will be created.
}

# Define the EC2 instance resource
resource "aws_instance" "example" {
  ami           = "ami-0522ab6e1ddcc7055"  # Replace with a valid AMI ID for your region.
  instance_type = "t2.micro"                # Specify the type of EC2 instance.
  
  # Key pair for SSH access
  key_name      = "devops-learning"        # name of your existing key pair.

  tags = {
    Name = "demo-instance"  # Assign a name tag to the instance for identification.
  }
}
