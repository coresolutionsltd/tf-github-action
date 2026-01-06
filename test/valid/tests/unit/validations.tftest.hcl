run "unit_plan" {
  command = plan

  variables {
    env    = "unit"
    region = "eu-west-1"
  }
}
