output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets

}

output "private_subnets" {
  value = module.vpc.private_subnets

}

output "intra_subnets" {
  value = module.vpc.intra_subnets

}