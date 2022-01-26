terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "gabalino-otus"
    region     = "ru-central1-a"
    key        = "otus/reddit_prod.tfstate"
    access_key = ""
    secret_key = ""

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
