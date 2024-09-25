# AWS Resources (EC2 Instance)
resource "aws_instance" "examaple" {
    ami = "provide-ami"
    instance_type = "t2.micro"
}

# Azure Resources (Resource Group)
resource "azurerm_resource_group" "example" {
  name = "example-resource"
  location = "eastus"
}