variable "region" {
  description = "Please Enter AWS region to deploy project"
  type        = string
  default     = "eu-central-1"
}
variable "instance_type" {
  description = "Please Enter AWS instance_type to deploy project "
  type        = string
  default     = "t2.micro"
}
variable "allow_ports" {
  description = "Please Enter AWS allow_ports to deploy project"
  type        = list(any)
  default     = ["80", "443"]
}
variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(any)
  default = {
    owner       = "Oleksandr Symonenko"
    project     = "webserver"
    environment = "prodaction"
  }
}
variable "cidr_blocks" {
  description = "Please Enter AWS cidr_blocks to deploy project"
  type        = list(any)
  default     = ["0.0.0.0/0"]
}
variable "cidr_blocks_myip" {
  description = "Please Enter AWS cidr_blocks_myip to deploy project"
  type        = list(any)
  default     = ["x.x.x.x/32"]
}
