# variable "access_key" {
#   type    = string
#   default = "**"
# }
# variable "secret_key" {
#   type    = string
#   default = "**"
# }
variable "region" {
  type    = string
  default = "eu-west-2"
}
variable "environment" {
  type    = string
  default = "Dev"
}

variable "s3-bucket" {
  type    = string
  default = "blogg1ng"
}
