variable "kube_config" {
  type      = string
  default  = "~/.kube/config"
}

variable "namespace-monitoring" {
  type     = string
  default = "monitoring"
}

variable "namespace-storage" {
  type     = string
  default = "storage"
} 

variable "namespace-linkerd" {
  type     = string
  default = "linkerd"
} 
