terraform {

    backend "s3" {

        bucket = "statefilebackendstorage100"
        key = "Day-14_1.3/terraform.tfstate"
        region = "us-east-1"
        use_path_style = true
      
    }

}