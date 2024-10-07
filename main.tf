resource "aws_ssm_parameter" "params" {
  count = length(var.params)
  name  = var.params[count.index].name
  type  = var.params[count.index].type
  value = var.params[count.index].value
}
# we have parameters for each component like frontend, catalgue, etc
# we need to go to roboshop-ansible --> frontend --> files --> roboshop.conf
variable "params" {
#  default = [
#    { name = "roboshop.dev.frontend.catalogue_url", value = "http://catalogue-dev.navien.site:8080/", type = "String" },
#    { name = "roboshop.dev.frontend.user_url", value = "http://user-dev.navien.site:8080/", type = "String" },
#    { name = "roboshop.dev.frontend.cart_url", value = "http://cart-dev.navien.site:8080/", type = "String" },
#    { name = "roboshop.dev.frontend.payment_url", value = "http://payment-dev.navien.site:8080/", type = "String" },
#    { name = "roboshop.dev.frontend.shipping_url", value = "http://shipping-dev.navien.site:8080/", type = "String" },
#
#
#    { name = "roboshop.dev.cart.redis_host", value = "redis-dev.navien.site", type = "String" },
#    { name = "roboshop.dev.cart.catalogue_host", value = "catalogue-dev.navien.site", type = "String" },
#    { name = "roboshop.dev.cart.catalogue_port", value = "8080", type = "String" },
#
#    { name = "roboshop.dev.catalogue.mongo", value = "true", type = "String" },
#    { name = "roboshop.dev.catalogue.mongo_url", value = "mongodb://mongodb-dev.navien.site:27017/catalogue", type = "String" },
#
#    { name = "roboshop.dev.payment.cart_host", value = "cart-dev.navien.site", type = "String" },
#    { name = "roboshop.dev.payment.cart_port", value = "8080", type = "String" },
#    { name = "roboshop.dev.payment.user_host", value = "user-dev.navien.site", type = "String" },
#    { name = "roboshop.dev.payment.user_port", value = "8080", type = "String" },
#    { name = "roboshop.dev.payment.amqp_host", value = "rabbitmq-dev.navien.site", type = "String" },
#    { name = "roboshop.dev.payment.amqp_user", value = "roboshop", type = "String" },
#
#
#    { name = "roboshop.dev.shipping.cart_endpoint", value = "cart-dev.navien.site:8080", type = "String" },
#    { name = "roboshop.dev.shipping.db_host", value = "mysql-dev.navien.site", type = "String" },
#
#    { name = "roboshop.dev.user.mongo", value = "true", type = "String" },
#    { name = "roboshop.dev.user.redis_host", value = "redis-dev.navien.site", type = "String" },
#    { name = "roboshop.dev.user.mongo_url", value = "mongodb://mongodb-dev.navien.site:27017/users", type = "String" },
#
#    ##Passwords will be never part of git repos usually in organization we create them manually. Meaning whom ever have access they will be provisioning the secrets in the organization
#    { name = "roboshop.dev.payment.amqp_pass", value = "roboshop123", type = "SecureString" },








    default = [
      { name = "roboshop.dev.frontend.catalogue_url", value = "http://catalogue-dev.saty.fun:8080/", type = "String" },
      { name = "roboshop.dev.frontend.user_url", value = "http://user-dev.saty.fun:8080/", type = "String" },
      { name = "roboshop.dev.frontend.cart_url", value = "http://cart-dev.saty.fun:8080/", type = "String" },
      { name = "roboshop.dev.frontend.payment_url", value = "http://payment-dev.saty.fun:8080/", type = "String" },
      { name = "roboshop.dev.frontend.shipping_url", value = "http://shipping-dev.saty.fun:8080/", type = "String" },


      { name = "roboshop.dev.cart.redis_host", value = "redis-dev.saty.fun", type = "String" },
      { name = "roboshop.dev.cart.catalogue_host", value = "catalogue-dev.saty.fun", type = "String" },
      { name = "roboshop.dev.cart.catalogue_port", value = "8080", type = "String" },

      { name = "roboshop.dev.catalogue.mongo", value = "true", type = "String" },
      { name = "roboshop.dev.catalogue.mongo_url", value = "mongodb://mongodb-dev.saty.fun:27017/catalogue", type = "String" },

      { name = "roboshop.dev.payment.cart_host", value = "cart-dev.saty.fun", type = "String" },
      { name = "roboshop.dev.payment.cart_port", value = "8080", type = "String" },
      { name = "roboshop.dev.payment.user_host", value = "user-dev.saty.fun", type = "String" },
      { name = "roboshop.dev.payment.user_port", value = "8080", type = "String" },
      { name = "roboshop.dev.payment.amqp_host", value = "rabbitmq-dev.saty.fun", type = "String" },
      { name = "roboshop.dev.payment.amqp_user", value = "roboshop", type = "String" },


      { name = "roboshop.dev.shipping.cart_endpoint", value = "cart-dev.saty.fun:8080", type = "String" },
      { name = "roboshop.dev.shipping.db_host", value = "mysql-dev.saty.fun", type = "String" },

      { name = "roboshop.dev.user.mongo", value = "true", type = "String" },
      { name = "roboshop.dev.user.redis_host", value = "redis-dev.saty.fun", type = "String" },
      { name = "roboshop.dev.user.mongo_url", value = "mongodb://mongodb-dev.saty.fun:27017/users", type = "String" },

      ##Passwords will be never part of git repos usually in organization we create them manually. Meaning whom ever have access they will be provisioning the secrets in the organization
      { name = "roboshop.dev.payment.amqp_pass", value = "roboshop123", type = "SecureString" },


     ]
}

