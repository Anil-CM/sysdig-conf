terraform {
  required_providers {
    sysdig = {
      source = "sysdiglabs/sysdig"
      version = "0.5.7"
    }

    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.20.1"
    }
  }
}

provider "sysdig" {
 sysdig_monitor_url = var.sysdig_monitor_url
 sysdig_monitor_api_token = var.sysdig_api_token
}

locals {
  ranges = [
    [var.range1_upper_threshold, var.range1_lower_threshold],
    [var.range2_upper_threshold, var.range2_lower_threshold], 
    [var.range3_upper_threshold, var.range3_lower_threshold]
  ]
}

resource "sysdig_monitor_alert_metric" "scale_up_alert" {
  count = var.number_of_scale_up_alerts
  name        =  "${var.scale_up_alert_name}-${count.index}"
  description = "Load balancer alert for scale up"
  severity    = 5
  metric                = "sum(avg(ibm_cloud_load_balancer_active_connections)) > ${local.ranges[count.index][0]} and sum(avg(ibm_cloud_load_balancer_active_connections)) <= ${local.ranges[count.index][1]}"
  trigger_after_minutes = 2
  notification_channels = [sysdig_monitor_notification_channel_webhook.cf_webhook_channel[count.index].id]
}

resource "sysdig_monitor_notification_channel_webhook" "cf_webhook_channel" {
  count = var.number_of_scale_up_alerts
  name                    = "Cloud-Function-Scale-Up-Webhook-${count.index}"
  enabled                 = true
  url                     = "${var.notification_channel_webhook_url}?vmcount=+2"
  notify_when_ok          = false
  notify_when_resolved    = false
  send_test_notification  = false
}

resource "sysdig_monitor_alert_metric" "scale_down_alert" {
  name        =  var.scale_down_alert_name
  description = "Load balancer alert for scale down"
  severity    = 5
  metric                = "sum(avg(ibm_cloud_load_balancer_active_connections)) > ${var.scaledown_lower_threshold} and sum(avg(ibm_cloud_load_balancer_active_connections)) <= ${var.scaledown_upper_threshold}"
  trigger_after_minutes = 15
  notification_channels = [sysdig_monitor_notification_channel_webhook.cf_webhook_scaledown_channel.id]
}

resource "sysdig_monitor_notification_channel_webhook" "cf_webhook_scaledown_channel" {
    name                    = "Cloud-Function-Scale-Down-Webhook"
    enabled                 = true
    url                     = "${var.notification_channel_webhook_url}?vmcount=-2"
    notify_when_ok          = false
    notify_when_resolved    = false
    send_test_notification  = false
}