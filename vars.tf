variable "default_region" {
  type    = string
  default = "us-east-1"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "ami" {
  type    = string
  #default = "ami-0557a15b87f6559cf" #ubuntu
  default = "ami-026b57f3c383c2eec"
}
variable "project_name" {
  type    = string
  default = "mobiquity"
}
variable "ssh_key_name" {
  type    = string
  default = "key-for-server"
}

variable "ssh_user" {
  type    = string
  default = "ec2-user"
}

##---- vpc vars -----
variable "vpc_cird" {
  type    = string
  default = "129.10.0.0/16"
}

variable "sub_cidr_pub" {
  type    = string
  default = "129.10.1.0/24"
}
variable "sub_cidr_pub2" {
  type    = string
  default = "129.10.2.0/24"
}


variable "cidr_all_ips" {
  type    = string
  default = "0.0.0.0/0"
}
variable "sub_az_1" {
  type    = string
  default = "us-east-1b"
}
variable "sub_az_2" {
  type    = string
  default = "us-east-1a"
}