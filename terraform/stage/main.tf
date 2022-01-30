provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "app" {
  source           = "../modules/app"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  image_id         = var.app_disk_image
  subnet_id        = var.subnet_id
  platform_id      = var.platform_id
  preemptible      = var.preemptible
  environment      = var.environment
  instance_count   = var.instance_count
  database_url     = "${module.db.internal_ip_address_db}:27017"
}

module "db" {
  source           = "../modules/db"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  image_id         = var.db_disk_image
  subnet_id        = var.subnet_id
  platform_id      = var.platform_id
  preemptible      = var.preemptible
  environment      = var.environment
}
