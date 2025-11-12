terraform {

    backend "s3" {

        bucket = "statefilebackendstorage100"
        key = "Day-12_1.2/terraform.tfstate"
        region = "us-east-1"
      
    }

}