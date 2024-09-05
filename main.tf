terraform {
  required_providers {
    minio = {
      source = "aminueza/minio"
      version = "2.5.0"
    }
  }
}



provider "minio" {

  minio_server       = "minio.minio:9000"
  minio_user   = "rootuser"
  minio_password   = "rootpass123"
}
resource "minio_s3_bucket" "state_terraform_s3" {
  bucket = "main-terraform-s3"
  acl    = "public"
}

output "minio_id" {
  value = "${minio_s3_bucket.state_terraform_s3.id}"
}

output "minio_url" {
  value = "${minio_s3_bucket.state_terraform_s3.bucket_domain_name}"
}