module "privatelink_network" {
  source = "./network"
  count  = var.create_privatelink_to_s3 ? 1 : 0
}

