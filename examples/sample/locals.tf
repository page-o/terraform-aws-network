locals {
  env                                  = "dev"
  project                              = "hoge"
  vpc_cidr_block                       = "172.16.0.0/16"
  public_subnet1_cidr_block            = "172.16.0.0/24"
  public_subnet2_cidr_block            = "172.16.4.0/24"
  public_subnet3_cidr_block            = "172.16.8.0/24"
  private_subnet1_cidr_block           = "172.16.32.0/24"
  private_subnet2_cidr_block           = "172.16.36.0/24"
  private_subnet3_cidr_block           = "172.16.40.0/24"
  private_secondary_subnet1_cidr_block = "172.16.64.0/24"
  private_secondary_subnet2_cidr_block = "172.16.68.0/24"
  private_secondary_subnet3_cidr_block = "172.16.72.0/24"
}
