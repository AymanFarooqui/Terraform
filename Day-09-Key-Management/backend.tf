terraform {

    backend "s3" {

        bucket = "statefilebackendstorage100"
        key = "Day-09_5/terraform.tfstate"
        region = "us-east-1"
      
    }

}