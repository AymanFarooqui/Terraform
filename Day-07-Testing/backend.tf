terraform {

    backend "s3" {

        bucket = "statefilebackendstorage100"
        key = "Day-07_3/terraform.tfstate"
        region = "us-east-1"
      
    }

}