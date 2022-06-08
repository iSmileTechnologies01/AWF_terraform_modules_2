variable "peer_owner_id" {
    type = string
    default = "431617346510"
}

variable "hub_vpc" {
    type = string
    default = module.hub.vpc_id
}

variable "spoke1vpc" {
   type = string
   default = module.spoke.vpc_id
}

variable "spoke2vpc" {
    type = string
    default = module.spoke2.vpc_id
  
}

variable "spoke3vpc" {
    type = string
    default = module.spoke3.vpc_id
  
}
