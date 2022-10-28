# Terraform Start

1. Deploy a single server

### For start we will create main.tf file where we will declare teh provider we are going to use:

```
provider "aws" {
 region = "us-east-2"
}
```

### Basic code to declare resourece is:

```
resource "<PROVIDER>_<TYPE>" "<NAME>" {
 [CONFIG ...]
 }
```
example code

```
resource "aws_instance" "example" {
 ami = "ami-0c55b159cbfafe1f0"
 instance_type = "t2.micro"
}
```
When creating ec2 instance mandatory values are 
ami and instance_type

To inicialize project we write terraform init (to tell Terraform to scan the code, figure out which providers you’re using, and download the code for them.)
Then we can do terraform plan (to check what will be created or what is the status). In my case for now I don't have any resources configured so the answe is:
```
No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration
and found no differences, so no changes are needed.
```

I'll add now the part for the ec2 resource

```
resource "aws_instance" "example" {
 ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  }
```

After running again terraform plan the output is:

```
Terraform will perform the following actions:

  # aws_instance.OrilyInstanceWeb will be created
    + resource "aws_instance" "OrilyInstanceWeb" {
    + ami                                  = "ami-0c55b159cbfafe1f0"

```

Basicly we see that new ec2 instance will be cretaed fro ami we specified. 

To actualy create the instance we do terraform apply

The output is:

```
Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

  Terraform will perform the following actions:

    # aws_instance.OrilyInstanceWeb will be created
      + resource "aws_instance" "OrilyInstanceWeb" {
      + ami                                  = "ami-0c55b159cbfafe1f0"
........

We will be asked to accept this:

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.

      Enter a value: yes

      aws_instance.OrilyInstanceWeb: Creating...


.........
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

```

We can now check on the console or via CLI if and what was created:

```
  28/10/2022   13:54.32   /drives/c/Users/Ilija.Dimitrov/Desktop/Work/Terraform_Privite/Orily_book_Teraform/MyCode  aws ec2 describe-instances --instance-ids i-09972b695beb7e26c
{
    "Reservations": [
        {
            "Groups": [],
            "Instances": [
                {
                    "AmiLaunchIndex": 0,
                    "ImageId": "ami-0c55b159cbfafe1f0",
                    "InstanceId": "i-09972b695beb7e26c",
                    "InstanceType": "t2.micro",
                    "LaunchTime": "2022-10-28T11:50:59+00:00",
                    "Monitoring": {
                        "State": "disabled"
                    },
                    "Placement": {
                        "AvailabilityZone": "us-east-2c",
                        "GroupName": "",
                        "Tenancy": "default"
                    },
                    "PrivateDnsName": "ip-172-31-42-241.us-east-2.compute.internal",
                    "PrivateIpAddress": "172.31.42.241",
                    "ProductCodes": [],
                    "PublicDnsName": "ec2-52-15-162-47.us-east-2.compute.amazonaws.com",
                    "PublicIpAddress": "52.15.162.47",
                    "State": {
                        "Code": 16,
                        "Name": "running"
                    },
                    "StateTransitionReason": "",
                    "SubnetId": "subnet-7812a734",
                    "VpcId": "vpc-b79e71dc",
                    "Architecture": "x86_64",
                    "BlockDeviceMappings": [
                        {
                            "DeviceName": "/dev/sda1",
                            "Ebs": {
                                "AttachTime": "2022-10-28T11:50:59+00:00",
                                "DeleteOnTermination": true,
                                "Status": "attached",
                                "VolumeId": "vol-02cc85c0a68124302"
                            }
                        }
                    ],
                    "ClientToken": "9DC2B270-FC6A-4428-B9AE-0E67D9E70ABD",
                    "EbsOptimized": false,
                    "EnaSupport": true,
                    "Hypervisor": "xen",
                    "NetworkInterfaces": [
                        {
                            "Association": {
                                "IpOwnerId": "amazon",
                                "PublicDnsName": "ec2-52-15-162-47.us-east-2.compute.amazonaws.com",
                                "PublicIp": "52.15.162.47"
                            },
                            "Attachment": {
                                "AttachTime": "2022-10-28T11:50:59+00:00",
                                "AttachmentId": "eni-attach-039748534c97971e2",
                                "DeleteOnTermination": true,
                                "DeviceIndex": 0,
                                "Status": "attached",
                                "NetworkCardIndex": 0
                            },
                            "Description": "",
                            "Groups": [
                                {
                                    "GroupName": "default",
                                    "GroupId": "sg-781e0a18"
                                }
                            ],
                            "Ipv6Addresses": [],
                            "MacAddress": "0a:1c:54:8c:6b:32",
                            "NetworkInterfaceId": "eni-0e39fd0cefb86f951",
                            "OwnerId": "386743670652",
                            "PrivateDnsName": "ip-172-31-42-241.us-east-2.compute.internal",
                            "PrivateIpAddress": "172.31.42.241",
                            "PrivateIpAddresses": [
                                {
                                    "Association": {
                                        "IpOwnerId": "amazon",
                                        "PublicDnsName": "ec2-52-15-162-47.us-east-2.compute.amazonaws.com",
                                        "PublicIp": "52.15.162.47"
                                    },
                                    "Primary": true,
                                    "PrivateDnsName": "ip-172-31-42-241.us-east-2.compute.internal",
                                    "PrivateIpAddress": "172.31.42.241"
                                }
                            ],
                            "SourceDestCheck": true,
                            "Status": "in-use",
                            "SubnetId": "subnet-7812a734",
                            "VpcId": "vpc-b79e71dc",
                            "InterfaceType": "interface"
                        }
                    ],
                    "RootDeviceName": "/dev/sda1",
                    "RootDeviceType": "ebs",
                    "SecurityGroups": [
                        {
                            "GroupName": "default",
                            "GroupId": "sg-781e0a18"
                        }
                    ],
                    "SourceDestCheck": true,
                    "VirtualizationType": "hvm",
                    "CpuOptions": {
                        "CoreCount": 1,
                        "ThreadsPerCore": 1
                    },
                    "CapacityReservationSpecification": {
                        "CapacityReservationPreference": "open"
                    },
                    "HibernationOptions": {
                        "Configured": false
                    },
                    "MetadataOptions": {
                        "State": "applied",
                        "HttpTokens": "optional",
                        "HttpPutResponseHopLimit": 1,
                        "HttpEndpoint": "enabled",
                        "HttpProtocolIpv6": "disabled",
                        "InstanceMetadataTags": "disabled"
                    },
                    "EnclaveOptions": {
                        "Enabled": false
                    },
                    "PlatformDetails": "Linux/UNIX",
                    "UsageOperation": "RunInstances",
                    "UsageOperationUpdateTime": "2022-10-28T11:50:59+00:00",
                    "PrivateDnsNameOptions": {
                        "HostnameType": "ip-name",
                        "EnableResourceNameDnsARecord": false,
                        "EnableResourceNameDnsAAAARecord": false
                    },
                    "MaintenanceOptions": {
                        "AutoRecovery": "default"
                    }
                }
            ],
            "OwnerId": "386743670652",
            "ReservationId": "r-0dbc9e03f91762a4c"
        }
    ]
}
                                                                                                                                                             ✓

  28/10/2022   13:55.10   /drives/c/Users/Ilija.Dimitrov/Desktop/Work/Terraform_Privite/Orily_book_Teraform/MyCode 

```

This being done we can see a lot of things that we might want to set like:
Instance Name. To do this we should configure Tag with Name with value we need. Basicly in the code under the ec2 instance resource we will add the option for Tag:

```
tags = {

	Name	=	"OrilyInstanceWeb"

}

we will have this code now:

provider "aws" {
 region = "us-east-2"
}

resource "aws_instance" "OrilyInstanceWeb" {
        ami             =       "ami-0c55b159cbfafe1f0"
        instance_type   =       "t2.micro"

        tags = {
                Name    =       "OrilyInstanceWeb"
        }

}

```

we can now do terraform plan and then apply

```
  28/10/2022   13:55.10   /drives/c/Users/Ilija.Dimitrov/Desktop/Work/Terraform_Privite/Orily_book_Teraform/MyCode  terraform.exe plan
aws_instance.OrilyInstanceWeb: Refreshing state... [id=i-09972b695beb7e26c]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_instance.OrilyInstanceWeb will be updated in-place
  ~ resource "aws_instance" "OrilyInstanceWeb" {
        id                                   = "i-09972b695beb7e26c"
      ~ tags                                 = {
          + "Name" = "OrilyInstanceWeb"
        }
      ~ tags_all                             = {
          + "Name" = "OrilyInstanceWeb"
        }
        # (29 unchanged attributes hidden)

        # (7 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
                                                                                                                                                         ✓

  28/10/2022   14:03.41   /drives/c/Users/Ilija.Dimitrov/Desktop/Work/Terraform_Privite/Orily_book_Teraform/MyCode 



   28/10/2022   14:03.41   /drives/c/Users/Ilija.Dimitrov/Desktop/Work/Terraform_Privite/Orily_book_Teraform/MyCode  terraform.exe apply
aws_instance.OrilyInstanceWeb: Refreshing state... [id=i-09972b695beb7e26c]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_instance.OrilyInstanceWeb will be updated in-place
  ~ resource "aws_instance" "OrilyInstanceWeb" {
        id                                   = "i-09972b695beb7e26c"
      ~ tags                                 = {
          + "Name" = "OrilyInstanceWeb"
        }
      ~ tags_all                             = {
          + "Name" = "OrilyInstanceWeb"
        }
        # (29 unchanged attributes hidden)

        # (7 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.OrilyInstanceWeb: Modifying... [id=i-09972b695beb7e26c]
aws_instance.OrilyInstanceWeb: Modifications complete after 2s [id=i-09972b695beb7e26c]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
                                                                                                                                                         ✓

  28/10/2022   14:04.41   /drives/c/Users/Ilija.Dimitrov/Desktop/Work/Terraform_Privite/Orily_book_Teraform/MyCode 


 and what we will have now on AWS is:

   28/10/2022   14:04.41   /drives/c/Users/Ilija.Dimitrov/Desktop/Work/Terraform_Privite/Orily_book_Teraform/MyCode  aws ec2 describe-instances --instance-ids i-09972b695beb7e26c
{
    "Reservations": [
        {
            "Groups": [],
            "Instances": [
                {
                    "AmiLaunchIndex": 0,
                    "ImageId": "ami-0c55b159cbfafe1f0",
                    "InstanceId": "i-09972b695beb7e26c",
                    "InstanceType": "t2.micro",
                    "LaunchTime": "2022-10-28T11:50:59+00:00",
                    "Monitoring": {
                        "State": "disabled"
                    },
                    "Placement": {
                        "AvailabilityZone": "us-east-2c",
                        "GroupName": "",
                        "Tenancy": "default"
                    },
                    "PrivateDnsName": "ip-172-31-42-241.us-east-2.compute.internal",
                    "PrivateIpAddress": "172.31.42.241",
                    "ProductCodes": [],
                    "PublicDnsName": "ec2-52-15-162-47.us-east-2.compute.amazonaws.com",
                    "PublicIpAddress": "52.15.162.47",
                    "State": {
                        "Code": 16,
                        "Name": "running"
                    },
                    "StateTransitionReason": "",
                    "SubnetId": "subnet-7812a734",
                    "VpcId": "vpc-b79e71dc",
                    "Architecture": "x86_64",
                    "BlockDeviceMappings": [
                        {
                            "DeviceName": "/dev/sda1",
                            "Ebs": {
                                "AttachTime": "2022-10-28T11:50:59+00:00",
                                "DeleteOnTermination": true,
                                "Status": "attached",
                                "VolumeId": "vol-02cc85c0a68124302"
                            }
                        }
                    ],
                    "ClientToken": "9DC2B270-FC6A-4428-B9AE-0E67D9E70ABD",
                    "EbsOptimized": false,
                    "EnaSupport": true,
                    "Hypervisor": "xen",
                    "NetworkInterfaces": [
                        {
                            "Association": {
                                "IpOwnerId": "amazon",
                                "PublicDnsName": "ec2-52-15-162-47.us-east-2.compute.amazonaws.com",
                                "PublicIp": "52.15.162.47"
                            },
                            "Attachment": {
                                "AttachTime": "2022-10-28T11:50:59+00:00",
                                "AttachmentId": "eni-attach-039748534c97971e2",
                                "DeleteOnTermination": true,
                                "DeviceIndex": 0,
                                "Status": "attached",
                                "NetworkCardIndex": 0
                            },
                            "Description": "",
                            "Groups": [
                                {
                                    "GroupName": "default",
                                    "GroupId": "sg-781e0a18"
                                }
                            ],
                            "Ipv6Addresses": [],
                            "MacAddress": "0a:1c:54:8c:6b:32",
                            "NetworkInterfaceId": "eni-0e39fd0cefb86f951",
                            "OwnerId": "386743670652",
                            "PrivateDnsName": "ip-172-31-42-241.us-east-2.compute.internal",
                            "PrivateIpAddress": "172.31.42.241",
                            "PrivateIpAddresses": [
                                {
                                    "Association": {
                                        "IpOwnerId": "amazon",
                                        "PublicDnsName": "ec2-52-15-162-47.us-east-2.compute.amazonaws.com",
                                        "PublicIp": "52.15.162.47"
                                    },
                                    "Primary": true,
                                    "PrivateDnsName": "ip-172-31-42-241.us-east-2.compute.internal",
                                    "PrivateIpAddress": "172.31.42.241"
                                }
                            ],
                            "SourceDestCheck": true,
                            "Status": "in-use",
                            "SubnetId": "subnet-7812a734",
                            "VpcId": "vpc-b79e71dc",
                            "InterfaceType": "interface"
                        }
                    ],
                    "RootDeviceName": "/dev/sda1",
                    "RootDeviceType": "ebs",
                    "SecurityGroups": [
                        {
                            "GroupName": "default",
                            "GroupId": "sg-781e0a18"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Tags": [
                        {
                            "Key": "Name",
                            "Value": "OrilyInstanceWeb"
                        }
                    ],
                    "VirtualizationType": "hvm",
                    "CpuOptions": {
                        "CoreCount": 1,
                        "ThreadsPerCore": 1
                    },
                    "CapacityReservationSpecification": {
                        "CapacityReservationPreference": "open"
                    },
                    "HibernationOptions": {
                        "Configured": false
                    },
                    "MetadataOptions": {
                        "State": "applied",
                        "HttpTokens": "optional",
                        "HttpPutResponseHopLimit": 1,
                        "HttpEndpoint": "enabled",
                        "HttpProtocolIpv6": "disabled",
                        "InstanceMetadataTags": "disabled"
                    },
                    "EnclaveOptions": {
                        "Enabled": false
                    },
                    "PlatformDetails": "Linux/UNIX",
                    "UsageOperation": "RunInstances",
                    "UsageOperationUpdateTime": "2022-10-28T11:50:59+00:00",
                    "PrivateDnsNameOptions": {
                        "HostnameType": "ip-name",
                        "EnableResourceNameDnsARecord": false,
                        "EnableResourceNameDnsAAAARecord": false
                    },
                    "MaintenanceOptions": {
                        "AutoRecovery": "default"
                    }
                }
            ],
            "OwnerId": "386743670652",
            "ReservationId": "r-0dbc9e03f91762a4c"
        }
    ]
}
                                                                                                                                                         ✓

  28/10/2022   14:05.15   /drives/c/Users/Ilija.Dimitrov/Desktop/Work/Terraform_Privite/Orily_book_Teraform/MyCode 

Here is what we added:
                    "Tags": [
                        {
                            "Key": "Name",
                            "Value": "OrilyInstanceWeb"
                        }
                    ],

```


