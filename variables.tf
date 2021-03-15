
variable "project" {
  type        = string
  description = "project id"
}

variable "region" {
  type        = string
  description = "project region"
}

variable "zone" {
  type        = string
  description = "project zone"
}

variable "credentials_file" {
  type        = string
  description = "json GCP credential file"

}
variable "environment" {
  type        = string
  description = "environment type"

}
variable "machine_types" {
  type = map(any)
  default = {
    dev  = "f1-micro"
    test = "n1-highcpu-32"
    prod = "n1-highcpu-32"
  }
  description = "type of GCP machine to use "
}

variable "ssh_key_file" {
  type        = string
  description = "path to public ssh key"

}