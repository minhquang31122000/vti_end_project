variable "vpc_id" {
  default = "vpc-095acf87b7fb3a939"

}
variable "cidr_allow" {
  default = "0.0.0.0/0"
}

variable "username" {
  default = "root"
}
variable "rd_pwd_postgre" {
  default = "123456789"

}
variable "identifier_db" {
  default = "mq-peter-rds-postgres"
}

variable "db_name" {
  default = "mq_peter_rds_postgres_db"
}
variable "enginedb" {
  default = "postgres"
}
variable "engine_version" {
  default = "16"
}
variable "instance_class" {
  default = "db.t3.medium"
}

variable "db_port" {
  default = 5432
}

variable "allocated_storage" {
  default = 20
}
variable "max_allocated_storage" {
  default = 50
}
variable "storage_type" {
  default = "gp2"
}

variable "availability_zone" {
  default = "ap-southeast-1a"
}
variable "db_subnet_group_name" {
  default = "mq-peter-db-subnet-gr"
}
variable "skip_final_snapshot" {
  default = true
}

variable "publicly_accessible" {
  default = true
}

variable "parameter_group_family" {
  default = "postgres16"

}
variable "parameter_group_name_description" {
  default = "postgres16 description"
}

variable "multi_az" {
  default = false
}

variable "apply_immediately" {
  default = true
}


variable "backup_retention_period" {
  default = 7
}
variable "tags" {
  default = {
    Name = "mq-peter-rds-postgres"
  }
}
variable "storage_credential_to_ssm" {
  default = true
}

