# aws-lambda-python-template

### Description

Creates a python lambda

### Setup

**Replace default `aws-lambda-python-template` to your project name.**

./tf/env_vars/dev.tfvars
```hcl-terraform
function_name = "aws-lambda-python-template"
```

./Makefile
```shell script
PROJECT_NAME := aws-lambda-python-template
```

./tf/backend_config/dev.tfvars
```hcl-terraform
key = "aws-lambda-python-template/main.tfstate"
```

**Replace terraform S3 state bucket account Ids**

./tf/backend_config/dev.tfvars
```hcl-terraform
bucket = "terraform-<ACCOUNT_ID>"
```

./tf/env_vars/dev.tfvars
```hcl-terraform
state_bucket = "terraform-<ACCOUNT_ID>"
```