variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "example-resource-group"
}

variable "location" {
  description = "The Azure location"
  type        = string
  default     = "West Europe"
}

variable "service_plan_name" {
  description = "The name of the App Service plan"
  type        = string
  default     = "example-service-plan"
}

variable "web_app_name" {
  description = "The name of the Web App"
  type        = string
  default     = "chika-enyinnaya9999"
}

variable "sku_name" {
  description = "SKU name for the App Service plan"
  type        = string
  default     = "B1"
}

variable "os_type" {
  description = "OS type for the App Service plan"
  type        = string
  default     = "Windows"
}
variable "always_on" {
  description = "Whether the Web App should always be on"
  type        = bool
  default     = true
} 