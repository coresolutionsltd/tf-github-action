
# 1. Missing required argument (ami is required for aws_instance)
resource "aws_instance" "missing_required_arg" {
  instance_type = "t2.micro"
  # ami argument is missing - this will fail validation
}

# 2. Invalid resource type (typo in resource name)
resource "aws_ec2_instanc" "typo_in_resource_type" {
  ami           = "ami-0123456789abcdef0"
  instance_type = "t2.micro"
}

# 3. Invalid argument name (typo in argument)
resource "aws_instance" "invalid_argument" {
  ami          = "ami-0123456789abcdef0"
  instance_typ = "t2.micro" # should be "instance_type"
}

# 4. Invalid value for enum-type argument
resource "aws_instance" "invalid_enum_value" {
  ami = "ami-0123456789abcdef0"
}
