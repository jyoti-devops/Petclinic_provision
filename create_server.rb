require 'chef/provisioning/aws_driver'

with_driver 'aws'

with_machine_options({
    bootstrap_options: {
    image_id: "ami-9a5787f9", # default for us-west-1
    instance_type: "t2.small",
    key_name: "arajdevops", # If not specified, this will be used and generated
    key_path: "/home/ubuntu/GoldenDemo.pem",
    subnet_id: 'subnet-f1171486',
    security_group_ids: 'sg-7d0bd819' 
      },
  use_private_ip_for_ssh: false, # DEPRECATED, use `transport_address_location`
  transport_address_location: :public_ip, # `:public_ip` (default), `:private_ip` or `:dns`.  Defines how SSH or WinRM should find an address to communicate with the instance.
})


1.upto(1) do |i|
machine "Petstore#{i}" do
  #recipe 'Petstore'
  tag 'Catalyst'
  converge true
end
end




