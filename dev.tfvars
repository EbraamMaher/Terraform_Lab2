environment          = "development"
region               = "eu-central-1"
availability_zones   = ["eu-central-1a", "eu-central-1b"]
vpc_cidr             = "10.0.0.0/16"
public_subnets_cidr  = ["10.0.0.0/24", "10.0.1.0/24"]
private_subnets_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
amazon_machine_image = "ami-070b208e993b59cea"
instance_type        = "t2.micro"
key                  = "key"


#RDS values
depends_on = ["aws_security_group.rds_sg"]
#identifier             = "${var.environment}"
allocated_storage      = "1"
engine                 = "mysql"
engine_version         = "5.7.21"
instance_class         = "db.t2.micro"
name                   = "statiatics"
username               = var.user
password               = var.pass
vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
db_subnet_group_name   = aws_db_subnet_group.rds_sg.id