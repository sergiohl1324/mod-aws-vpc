locals {
  env_name                      = var.environment
  db_subnet_group_name          = "${local.env_name}-db"
  redshift_subnet_group_name    = "${local.env_name}-redshift"
  elasticache_subnet_group_name = "${local.env_name}-elasticache"
  eks_subnet_group_name         = "${local.env_name}-eks"
  max_subnet_length             = max(length(var.private_subnets), length(var.elasticache_subnets), length(var.database_subnets), length(var.redshift_subnets))
  nat_gateway_count             = var.single_nat_gateway ? 1 : (var.one_nat_gateway_per_az ? length(var.azs) : local.max_subnet_length)
  s3_endpoint_count             = var.one_s3_endpoint_per_az ? length(var.private_subnets) : 1

  # Use `local.vpc_id` to give a hint to Terraform that subnets should be deleted before secondary CIDR blocks can be free!
  vpc_id = element(concat(aws_vpc_ipv4_cidr_block_association.this.*.vpc_id, aws_vpc.this.*.id, tolist([""])), 0)

  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
      ManagedBy   = "terraform"
    },
    var.tags
  )
}
