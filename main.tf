resource "aws_ssm_parameter" "params" {
  count = length(var.params)
  name  = var.params[count.index].name
  type  = var.params[count.index].type
  value = var.params[count.index].value
  key_id = "815fadb2-9c2d-4375-8f17-797f1813876c"
 # key_id = "cb39c8a1-86a4-4d5c-8daf-f85da8e27ee4"
  overwrite = true
}
# we have parameters for each component like frontend, catalgue, etc
# we need to go to roboshop-ansible --> frontend --> files --> roboshop.conf
variable "params" {
  default = [

    # Frontend
    { name = "roboshop.dev.frontend.catalogue_url", value = "http://catalogue-dev.navien.site/", type = "String" },
    { name = "roboshop.dev.frontend.user_url", value = "http://user-dev.navien.site/", type = "String" },
    { name = "roboshop.dev.frontend.cart_url", value = "http://cart-dev.navien.site/", type = "String" },
    { name = "roboshop.dev.frontend.payment_url", value = "http://payment-dev.navien.site/", type = "String" },
    { name = "roboshop.dev.frontend.shipping_url", value = "http://shipping-dev.navien.site/", type = "String" },

    # Cart

    { name = "roboshop.dev.cart.redis_host", value = "elasticache-dev.nud0cy.clustercfg.use1.cache.amazonaws.com", type = "String" }, # might change based on your elasticache cluster configuration
    { name = "roboshop.dev.cart.catalogue_host", value = "catalogue-dev.navien.site", type = "String" },
    { name = "roboshop.dev.cart.catalogue_port", value = "8080", type = "String" },

    # Catalogue

    { name = "roboshop.dev.catalogue.elasticsearch_host", value = "elasticsearch-dev.navien.site", type = "String" },
    { name = "roboshop.dev.catalogue.mongo", value = "true", type = "String" },    {
      name = "roboshop.dev.catalogue.mongo_url", value = "mongodb://mongodb-dev.navien.site:27017/catalogue",
      type = "String"
    },
    { name = "roboshop.dev.catalogue.docdb_endpoint", value = "docdb-dev.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com", type = "String" }, # "docdb-dev.cluster-cbvsbeoyxek" might change based on your account


    # payment

    { name = "roboshop.dev.payment.cart_host", value = "cart-dev.navien.site", type = "String" },
    { name = "roboshop.dev.payment.cart_port", value = "80", type = "String" },
    { name = "roboshop.dev.payment.user_host", value = "user-dev.navien.site", type = "String" },
    { name = "roboshop.dev.payment.user_port", value = "80", type = "String" },
    { name = "roboshop.dev.payment.amqp_host", value = "rabbitmq-dev.navien.site", type = "String" },
    { name = "roboshop.dev.payment.amqp_user", value = "roboshop", type = "String" },

    # shipping

    { name = "roboshop.dev.shipping.cart_endpoint", value = "cart-dev.navien.site:80", type = "String" },
    { name = "roboshop.dev.shipping.db_host", value = "rds-dev.cluster-cbvsbeoyxek4.us-east-1.rds.amazonaws.com", type = "String" }, # might change based on your rds

    # User

    { name = "roboshop.dev.user.elasticsearch_host", value = "elasticsearch-dev.navien.site", type = "String" },
    { name = "roboshop.dev.user.mongo", value = "true", type = "String" },
    { name = "roboshop.dev.user.redis_host", value = "elasticache-dev.nud0cy.clustercfg.use1.cache.amazonaws.com", type = "String" }, # might change based on your elasticache cluster configuration
    { name = "roboshop.dev.user.mongo_url", value = "mongodb://mongodb-dev.navien.site:27017/users", type = "String" },

    # RabbitMQ

    { name = "roboshop.dev.rabbitmq.amqp_host", value = "rabbitmq-dev.navien.site", type = "String" },
    { name = "roboshop.dev.rabbitmq.rabbitmq_host", value = "rabbitmq-dev.navien.site", type = "String" },
    { name = "roboshop.dev.rabbitmq.amqp_user", value = "roboshop", type = "String" },
    { name = "roboshop.dev.mysql.username", value = "roboshop", type = "String" },

    # MongoDB or Docdb

    { name = "roboshop.dev.mysql.username", value = "roboshop", type = "String" },
    { name = "roboshop.dev.mysql.endpoint", value = "rds-dev.cluster-cbvsbeoyxek4.us-east-1.rds.amazonaws.com", type = "String" }, #"rds-dev.cluster-cbvsbeoyxek4" might change based on your account
    { name = "roboshop.dev.docdb.username", value = "roboshop", type = "String" },
    { name = "roboshop.dev.user.docdb_endpoint", value = "docdb-dev.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com", type = "String"}, # "docdb-dev.cluster-cbvsbeoyxek" might change based on your account

    # Catalogue or cart

    { name = "roboshop.dev.cart.catalogue_host", value = "catalogue-dev.navien.site", type = "String" },
    { name = "roboshop.dev.cart.catalogue_port", value = "80", type = "String" },
    { name = "roboshop.dev.catalogue.mongo", value = "true", type = "String" },
    { name = "roboshop.dev.catalogue.docdb_endpoint", value = "docdb-dev.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com", type = "String" }, # "docdb-dev.cluster-cbvsbeoyxek" might change based on your account




    ##Passwords will be never part of git repos usually in organization we create them manually. Meaning whom ever have access they will be provisioning the secrets in the organization

    { name = "roboshop.dev.payment.amqp_pass", value = "roboshop123", type = "SecureString" },
    { name = "roboshop.dev.rabbitmq.amqp_pass", value = "roboshop123", type = "SecureString" },
    { name = "roboshop.dev.mysql.password", value = "roboshop123", type = "SecureString" },
    { name = "roboshop.dev.docdb.password", value = "roboshop123", type = "SecureString" },

    { name = "roboshop.dev.catalogue.mongo_url", value = "mongodb://roboshop:roboshop123@docdb-dev.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com:27017/catalogue?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false", type = "SecureString" }, # cluster-cbvsbeoyxek4  might change based on your account

    { name = "roboshop.dev.user.mongo_url", value = "mongodb://roboshop:roboshop123@docdb-dev.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com:27017/users?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false", type = "SecureString" }, # cluster-cbvsbeoyxek4  might change based on your account


############################################################################################  PROD #################################################################

    # Frontend
    { name = "roboshop.prod.frontend.catalogue_url", value = "http://catalogue-prod.navien.site/", type = "String" },
    { name = "roboshop.prod.frontend.user_url", value = "http://user-prod.navien.site/", type = "String" },
    { name = "roboshop.prod.frontend.cart_url", value = "http://cart-prod.navien.site/", type = "String" },
    { name = "roboshop.prod.frontend.payment_url", value = "http://payment-prod.navien.site/", type = "String" },
    { name = "roboshop.prod.frontend.shipping_url", value = "http://shipping-prod.navien.site/", type = "String" },

    # Cart

    { name = "roboshop.prod.cart.redis_host", value = "elasticache-prod.nud0cy.clustercfg.use1.cache.amazonaws.com", type = "String" }, # might change based on your elasticache cluster configuration
    { name = "roboshop.prod.cart.catalogue_host", value = "catalogue-prod.navien.site", type = "String" },
    { name = "roboshop.prod.cart.catalogue_port", value = "8080", type = "String" },

    # Catalogue

    { name = "roboshop.prod.catalogue.elasticsearch_host", value = "elasticsearch-prod.navien.site", type = "String" },
    { name = "roboshop.prod.catalogue.mongo", value = "true", type = "String" },    {
      name = "roboshop.prod.catalogue.mongo_url", value = "mongodb://mongodb-prod.navien.site:27017/catalogue",
      type = "String"
    },
    { name = "roboshop.prod.catalogue.docdb_endpoint", value = "docdb-prod.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com", type = "String" }, # "docdb-prod.cluster-cbvsbeoyxek" might change based on your account


    # payment

    { name = "roboshop.prod.payment.cart_host", value = "cart-prod.navien.site", type = "String" },
    { name = "roboshop.prod.payment.cart_port", value = "80", type = "String" },
    { name = "roboshop.prod.payment.user_host", value = "user-prod.navien.site", type = "String" },
    { name = "roboshop.prod.payment.user_port", value = "80", type = "String" },
    { name = "roboshop.prod.payment.amqp_host", value = "rabbitmq-prod.navien.site", type = "String" },
    { name = "roboshop.prod.payment.amqp_user", value = "roboshop", type = "String" },

    # shipping

    { name = "roboshop.prod.shipping.cart_endpoint", value = "cart-prod.navien.site:80", type = "String" },
    { name = "roboshop.prod.shipping.db_host", value = "rds-prod.cluster-cbvsbeoyxek4.us-east-1.rds.amazonaws.com", type = "String" }, # might change based on your rds

    # User

    { name = "roboshop.prod.user.elasticsearch_host", value = "elasticsearch-prod.navien.site", type = "String" },
    { name = "roboshop.prod.user.mongo", value = "true", type = "String" },
    { name = "roboshop.prod.user.redis_host", value = "elasticache-prod.nud0cy.clustercfg.use1.cache.amazonaws.com", type = "String" }, # might change based on your elasticache cluster configuration
    { name = "roboshop.prod.user.mongo_url", value = "mongodb://mongodb-prod.navien.site:27017/users", type = "String" },

    # RabbitMQ

    { name = "roboshop.prod.rabbitmq.amqp_host", value = "rabbitmq-prod.navien.site", type = "String" },
    { name = "roboshop.prod.rabbitmq.rabbitmq_host", value = "rabbitmq-prod.navien.site", type = "String" },
    { name = "roboshop.prod.rabbitmq.amqp_user", value = "roboshop", type = "String" },
    { name = "roboshop.prod.mysql.username", value = "roboshop", type = "String" },

    # MongoDB or Docdb

    { name = "roboshop.prod.mysql.username", value = "roboshop", type = "String" },
    { name = "roboshop.prod.mysql.endpoint", value = "rds-prod.cluster-cbvsbeoyxek4.us-east-1.rds.amazonaws.com", type = "String" }, #"rds-prod.cluster-cbvsbeoyxek4" might change based on your account
    { name = "roboshop.prod.docdb.username", value = "roboshop", type = "String" },
    { name = "roboshop.prod.user.docdb_endpoint", value = "docdb-prod.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com", type = "String"}, # "docdb-prod.cluster-cbvsbeoyxek" might change based on your account

    # Catalogue or cart

    { name = "roboshop.prod.cart.catalogue_host", value = "catalogue-prod.navien.site", type = "String" },
    { name = "roboshop.prod.cart.catalogue_port", value = "80", type = "String" },
    { name = "roboshop.prod.catalogue.mongo", value = "true", type = "String" },
    { name = "roboshop.prod.catalogue.docdb_endpoint", value = "docdb-prod.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com", type = "String" }, # "docdb-prod.cluster-cbvsbeoyxek" might change based on your account




    ##Passwords will be never part of git repos usually in organization we create them manually. Meaning whom ever have access they will be provisioning the secrets in the organization

    { name = "roboshop.prod.payment.amqp_pass", value = "roboshop123", type = "SecureString" },
    { name = "roboshop.prod.rabbitmq.amqp_pass", value = "roboshop123", type = "SecureString" },
    { name = "roboshop.prod.mysql.password", value = "roboshop123", type = "SecureString" },
    { name = "roboshop.prod.docdb.password", value = "roboshop123", type = "SecureString" },

    { name = "roboshop.prod.catalogue.mongo_url", value = "mongodb://roboshop:roboshop123@docdb-prod.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com:27017/catalogue?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false", type = "SecureString" }, # cluster-cbvsbeoyxek4  might change based on your account

    { name = "roboshop.prod.user.mongo_url", value = "mongodb://roboshop:roboshop123@docdb-prod.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com:27017/users?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false", type = "SecureString" }, # cluster-cbvsbeoyxek4  might change based on your account


  ]
}

