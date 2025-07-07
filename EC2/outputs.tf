output "instance_id" {
  value = aws_instance.instance.id
}
# ~/myproject/EC2/outputs.tf

output "instance_id" {
  description = "i-0d37814921bd66699"
  # Replace 'aws_instance.instance' with the actual resource name and local name
  # you used for your ecomm instance (e.g., aws_instance.ecomm or aws_instance.web_server_1)
  value       = aws_instance.instance.id # <--- Adjust 'instance' if your instance is named 'ecomm'
}

# If you're using a count or for_each for instances, you'd output a list:
# output "instance_ids" {
#   description = "List of EC2 instance IDs."
#   value       = [for instance in aws_instance.all_instances : instance.id]
# }

# ~/myproject/EC2/outputs.tf

