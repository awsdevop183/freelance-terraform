terraform {
  backend "s3" {
    bucket = "madhukarreddyeng.com"
    key    = "prod statefile"
    region = "us-east-1"
  }
}
