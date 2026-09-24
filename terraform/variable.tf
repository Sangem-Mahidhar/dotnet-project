variable "azure_resource_group" {
    description = "RG Name"
    type = string
    default = "NetflixRG"
}

variable "location" {   
    description = "Location"
    type = string
    default = "canadacentral"
} 

variable "ASP_Name" {
    description = "ASP Name"
    type = string
    default = "Netflix_ASP"
}

variable "APP_Name" {
    description = "APP_Name"
    type = string
    default = "Netflix-App-2001"
}

variable "storage_account_name" {
    description = "name"
    type = string
    default = "netflixsa2001"
  
}
