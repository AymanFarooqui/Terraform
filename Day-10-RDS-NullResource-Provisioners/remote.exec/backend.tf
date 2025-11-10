terraform {

    backend "s3" {

        bucket = "statefilebackendstorage100"
        key = "Day-10_2.2/terraform.tfstate"
        region = "us-east-1"
      
    }

}