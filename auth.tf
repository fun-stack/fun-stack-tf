module "auth" {
  count  = local.auth == null ? 0 : 1
  source = "./auth"

  prefix         = local.prefix
  domain         = local.domain_auth
  hosted_zone_id = concat(data.aws_route53_zone.domain[*].zone_id, [null])[0]

  redirect_urls         = local.redirect_urls
  allow_unauthenticated = local.ws == null ? true : local.ws.allow_unauthenticated

  providers = {
    aws    = aws
    aws.us = aws.us
  }
}
