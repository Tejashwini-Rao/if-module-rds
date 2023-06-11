resource "aws_rds_cluster" "rds" {
  cluster_identifier = "${var.env}-rds-cluster
  engine             = "aurora-mysql"
  engine_version     = var.rds_engine_version
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "bar"
}

resource "aws_db_subnet_group" "rds" {
  name       = "main"
  subnet_ids =  module.vpc.subnets["db"].subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}