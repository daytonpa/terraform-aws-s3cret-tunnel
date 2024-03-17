variable "region" {
  type = string
  description = "(Optional) The AWS Region where Resoruces will be built."
  default = "us-east-2"
}

variable "create_privatelink_to_s3" {
  type = bool
  default = false
  description = "(Optional) Create the s3cret tunnel!"
}
