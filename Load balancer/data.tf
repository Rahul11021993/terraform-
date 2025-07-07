# ~/myproject/Load balancer/data.tf or main.tf

data "terraform_remote_state" "ec2_module" {
  backend = "local" # Assuming your EC2 module uses local state. If it uses S3, configure it here.
  config = {
    path = "../EC2/terraform.tfstate" # Adjust path if different
  }
}

# Don't forget your depends_on if it's there
# depends_on = [
#   data.terraform_remote_state.ec2_module.outputs.ecomm_instance_id,
#   data.terraform_remote_state.ec2_module.outputs.food_instance_id,
# ]
