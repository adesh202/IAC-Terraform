# Defining AWS Providers with Aliases for Multiple Regions
provider "aws" {
    alias = "us-east-1"
    region = "us-east-1"
}

provider "aws" {
  alias = "us-south-1"
  region = "us-south-1"
}

# Defining Azure Providers with Aliases for Multiple Regions

provider "azurerm" {
  alias = "east_us"
  features {}
}


provider "azurerm" {
  alias = "west_europe"
  features {}
}

# AWS Resources in us-west-2
resource "aws_instance" "us_west_instance" {
  provider      = aws.us_west
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "AWS EC2 in us-west-2"
  }
}

# AWS Resources in us-east-1
resource "aws_instance" "us_east_instance" {
  provider      = aws.us_east
  ami           = "ami-0b898040803850657"
  instance_type = "t2.micro"
  tags = {
    Name = "AWS EC2 in us-east-1"
  }
}

# Azure Resources in East US
resource "azurerm_resource_group" "east_us_group" {
  provider = azurerm.east_us
  name     = "east-us-resources"
  location = "East US"

  tags = {
    environment = "Production"
  }
}

# Azure Resources in West Europe
resource "azurerm_resource_group" "west_europe_group" {
  provider = azurerm.west_europe
  name     = "west-europe-resources"
  location = "West Europe"

  tags = {
    environment = "Staging"
  }
}