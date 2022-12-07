variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR #1 & #2 Values"
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR #1 & #2 Values"
  default     = ["10.1.4.0/24", "10.1.5.0/24"]

}

variable "Availability_Zones" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1", "us-west-2"]
}