module "Network" {
    #==================== SOURCE
    source                = "./Modules/Network"
    #==================== VARS
    subnet_count          = var.subnet_count
    subnets               = var.subnets
    vpc_config            = var.vpc_config
    route_table_config    = var.route_table_config
    ingress_cidr_blocks   = var.ingress_cidr_blocks
    egress_cidr_blocks    = var.egress_cidr_blocks
    ingress_rules         = var.ingress_rules
    egress_rules          = var.egress_rules
    rules                 = var.rules
}

module "Compute" {
    #==================== SOURCE
    source                = "./Modules/Compute"
    #==================== DEPENDS ON NETWORK
    depends_on            = [module.Network]

    SUBNET_IDs            = module.Network.SUBNET_IDs
    SEC_GROUP_ID          = module.Network.SEC_GROUP_ID
    VPC_GROUP_ID          = module.Network.VPC_GROUP_ID
    #==================== VARS
    subnet_count          = var.subnet_count
    cluster_config        = var.cluster_config
    node_group_config     = var.node_group_config
    DB_Username           = var.DB_Username
    DB_Password           = var.DB_Password
}

module "Apps" {
    #==================== SOURCE
    source                = "./Modules/Apps"
    #==================== DEPENDS ON Compute
    depends_on            = [module.Compute]
    
    db_address            = module.Compute.DATABASE_ENDPOINT
    #==================== VARS
    dns_config            = var.dns_config
    front_url             = var.front_url
    db_username           = var.DB_Username
    db_password           = var.DB_Password
    email_username        = var.email_username
    email_password        = var.email_password
    cert_arn              = var.cert_arn
    fido_secret           = var.fido_secret
    mode                  = var.mode
}