terraform {

    backend "s3" {

        bucket = "statefilebackendstorage100"
        key = "3-Tier-App-Infra/terraform.tfstate"
        #use_lockfile = true               # S3 native locking only works for versions above 1.19
        region = "us-east-1"
        #dynamodb_table = "aws-Dynamodb"   # Works for all versions
        #encrypt = true


    }

}