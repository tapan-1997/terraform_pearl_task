variable "aws_region" {
       description = "The AWS region to create." 
       default     = "us-east-2" 
}

variable "key_name" { 
    description = " SSH keys to connect to ec2 instance" 
    default     =  "pt_task_Key" 
}

variable "instance_type" { 
    description = "instance type for ec2" 
    default     =  "t2.micro" 
}

variable "security_group" { 
    description = "Name of security group" 
    default     = "pt_security-group" 
}

variable "tag_name" { 
    description = "Tag Name of for Ec2 instance" 
    default     = "pt_instance" 
} 
variable "ami_id" { 
    description = "AMI for Ubuntu Ec2 instance" 
    default     = "ami-0b9064170e32bde34" 
}
