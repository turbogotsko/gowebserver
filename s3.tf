resource "aws_s3_bucket" "go_app" {
    bucket = "turbogotsko-storage"
}

resource "aws_s3_bucket" "go_app_2" {
    bucket = "go-web-server-test"
}