locals {
  my_pi_to_cidr = "${jsondecode(
    data.http.my_public_ip_address.response_body
  ).ip}/32"
}

data "http" "my_public_ip_address" {
  url = "https://ifconfig.co/json"
  retry {
    attempts = 4
  }
  request_headers = {
    Accept = "application/json"
  }
}
