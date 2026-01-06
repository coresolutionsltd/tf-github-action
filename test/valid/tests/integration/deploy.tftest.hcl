run "integration_apply" {
  command = apply

  variables {
    env    = "integration"
    region = "eu-west-1"
  }
}
