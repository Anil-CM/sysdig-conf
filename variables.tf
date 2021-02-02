variable "sysdig_monitor_url" {
    type = string
    default = ""
}

variable "sysdig_api_token"{
    type = string
    default = ""
}

variable "scale_up_alert_name"{
    type = string
    default = ""
}

variable "scale_down_alert_name"{
    type = string
    default = ""
}

variable "range1_upper_threshold" {
    type = string
}

variable "range1_lower_threshold" {
    type = string
}

variable "range2_upper_threshold" {
    type = string
}

variable "range2_lower_threshold" {
    type = string
}

variable "range3_upper_threshold" {
    type = string
}

variable "range3_lower_threshold" {
    type = string
}

variable "scaledown_lower_threshold"{
    type = string
}

variable "scaledown_upper_threshold"{
    type = string
}

variable "number_of_scale_up_alerts" {
    default = 3
}

variable "notification_channel_webhook_url" {
    type = string
}