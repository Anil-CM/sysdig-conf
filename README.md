# sysdig-conf

This module configures the sysdig-monitoring with alerts creation and notifiaction channel creation for loadbalancer metrics.


## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |


## Providers

| Name | Version |
|------|---------|
| sysdig | >= 0.5.7 |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| sysdig\_monitor\_url | Sysdig Monitor URL. | `string` | n/a | yes |
| sysdig\_api\_token | API token for the sysdig monitoring | `string` | n/a | yes |
| scale\_up\_alert\_name | Alert name for sclaing up the VSIs | `string` | n/a | yes |
| scale\_down\_alert\_name | Alert name for scaling down the VSIs | `string` | n/a | yes |
| range1\_upper\_threshold | Number of active connections upper threshold for the alert1 for scale up | `string` | n/a | yes |
| range2\_upper\_threshold | Number of active connections upper threshold for the alert2 for scale up | `string` | n/a | yes |
| range3\_upper\_threshold | Number of active connections upper threshold for the alert3 for scale up | `string` | n/a | yes |
| range1\_lower\_threshold | Number of active connections lower threshold for the alert1 for scale up | `string` | n/a | yes |
| range2\_lower\_threshold | Number of active connections lower threshold for the alert2 for scale up | `string` | n/a | yes |
| range3\_lower\_threshold | Number of active connections lower threshold for the alert3 for scale up | `string` | n/a | yes |
| scaledown\_upper\_threshold | Number of active connections upper threshold for the scale down alert | `string` | n/a | yes |
| scaledown\_lower\_threshold | Number of active connections lower threshold for the scale down alert | `string` | n/a | yes |
| number\_of\_scale\_up\_alerts | Number of scale up alerts to be configured | `number` |  n/a | yes |


## License

Apache 2 Licensed. See [LICENSE](LICENSE) for full details.