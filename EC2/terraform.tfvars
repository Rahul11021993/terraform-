bucket_name            = "devopstest2027"
environment            = "test"
instance_volumes       = [{ "size" : 10, "device" : "/dev/sdf" }, { "size" : 12, "device" : "/dev/sdg" }, { "size" : 15, "device" : "/dev/sdh" }]
name                   = "myproject"
ssh_key_name           = "aws project"
subnet_id              = "subnet-0cb6c2cfd616ab99f"
vpc_security_group_ids = ["sg-0b1a65a3a965b526b"]