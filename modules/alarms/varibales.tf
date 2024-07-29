variable "alarms" {
  type = object({
    enabled       = optional(bool, true)
    topic         = string
    custom_values = optional(any, {})
  })
  description = "Monitor cluster redis nodes and send alarm to specified topic if memory/cpu/connecions crosses"
}

variable "cacheclusterids" {
  type        = list(string)
  description = "Cache cluster id or ids"
}

variable "name" {
  type        = string
  description = "Name"
}

variable "member_clusters_count" {
  type        = number
  description = "Member cluster count"
}
