# Apply all modules
apply:
    terraform apply -var-file="user/terraform.tfvars"

# Plan all modules
plan:
    terraform plan -var-file="user/terraform.tfvars"

# Init terraform
init:
    terraform init

# Apply only S3 module
apply-s3:
    terraform apply -target=module.s3 -var-file="user/terraform.tfvars"
    @just show-s3-keys

# Apply only alert module
apply-alert:
    terraform apply -target=module.alert -var-file="user/terraform.tfvars"

# Apply only dokploy module
apply-dokploy:
    terraform apply -target=module.dokploy -var-file="user/terraform.tfvars"

# Plan S3 module
plan-s3:
    terraform plan -target=module.s3 -var-file="user/terraform.tfvars"

# Plan alert module
plan-alert:
    terraform plan -target=module.alert -var-file="user/terraform.tfvars"

# Plan dokploy module
plan-dokploy:
    terraform plan -target=module.dokploy -var-file="user/terraform.tfvars"

# Destroy all
destroy:
    terraform destroy -var-file="user/terraform.tfvars"

# Destroy only S3 module
destroy-s3:
    terraform destroy -target=module.s3 -var-file="user/terraform.tfvars"

# Show S3 secret keys
show-s3-keys:
    @echo "Standard Bucket Secret Key:"
    @terraform output -raw standard_bucket_secret_key
    @echo "\n\nArchive Bucket Secret Key:"
    @terraform output -raw archive_bucket_secret_key
    @echo ""

# Destroy only alert module
destroy-alert:
    terraform destroy -target=module.alert -var-file="user/terraform.tfvars"

# Destroy only dokploy module
destroy-dokploy:
    terraform destroy -target=module.dokploy -var-file="user/terraform.tfvars"

# Format terraform files
fmt:
    terraform fmt -recursive

# Validate configuration
validate:
    terraform validate
