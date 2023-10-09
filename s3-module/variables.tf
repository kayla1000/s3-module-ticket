variable "env" {
  type    = string
  default = "dev" # Only lowercase alphanumeric character is allowed for naming convention of s3 bucket creation and it will fail on terraform apply
}                 # Dev is not allowed because of capital D but dev is allowed
                  # note that we can have terraform function to convert name's upper case to lower case and an example is given in s3.tf 

variable "region" {
  type    = string
  default = "us-west-2"
}