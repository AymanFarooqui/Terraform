terraform {

    backend "s3" {

        bucket = "statefilebackendstorage100"
        key = "Day-11_5/terraform.tfstate"
        region = "us-east-1"
      
    }

}