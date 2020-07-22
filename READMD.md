# Simple Workshop VPS

This repo will create a simple Virtual Private Server (i.e. a VM) in Digital Ocean to create a normalized environment when running a workshop.

# Usage
Copy the `tfvars.tf.example` to your own copy, fill out (follow the comments), and enjoy.
```shell script
cp tfvars.tf.example tfvars.tf
terraform init
terraform plan -out plan
terraform apply
```

# How Does it Work?
Creates a VM, then runs the script `user_data.sh` on it. Feel free to modify the shell script to suit your needs.
