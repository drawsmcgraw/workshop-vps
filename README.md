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

# Creating Users on the Platform
In addition to accounts on the VPS, you'll need accounts on the Platform. In this example, we're making an org of `workshop` and a space of `workshop` and assigning the appropriate role.

```shell
# Log in as the CF admin first!

cf create-org workshop
cf create-space -o workshop workshop

cf target -o workshop -s workshop

for user in user-01\
            user-02\
            user-03\
            user-04\
            user-05\
            user-06\
            user-07\
            user-08\
            user-09\
            user-10; do
  cf create-user ${user} thecloudrocksmysocks
  cf set-space-role ${user} workshop workshop SpaceDeveloper
done 
```