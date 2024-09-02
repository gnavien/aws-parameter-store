resource "aws_ssm_parameter" "params" {
  count = length(var.params)
  name  = var.params[count.index].name
  type  = var.params[count.index].type
  value = var.params[count.index].value
}
# we have parameters for each component like frontend, catalgue, etc
# we need to go to roboshop-ansible --> frontend --> files --> roboshop.conf
#variable "params" {
#  default = [
#    { name = "roboshop.dev.frontend.catalogue_url", value = "http://catalogue-dev.navien.site:8080/", type = "string" },
#    { name = "roboshop.dev.frontend.user_url", value = "http://user-dev.navien.site:8080/", type = "string" },
#    { name = "roboshop.dev.frontend.cart_url", value = "http://cart-dev.navien.site:8080/", type = "string" },
#    { name = "roboshop.dev.frontend.payment_url", value = "http://payment-dev.navien.site:8080/", type = "string" },
#    { name = "roboshop.dev.frontend.shipping_url", value = "http://shipping-dev.navien.site:8080/", type = "string" },
#     ]
#}

variable "params" {
  default = [
    { name = "demo1", value = "demo1", type  = "string" },
    { name = "demo2", value = "demo2", type  = "string" },
    ]
  }