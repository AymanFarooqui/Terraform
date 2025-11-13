terraform {

    backend "s3" {

        bucket = "statefilebackendstorage100"
        key = "Day-13/terraform.tfstate"
        region = "us-east-1"
      
    }

}