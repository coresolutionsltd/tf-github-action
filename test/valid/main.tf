resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "echo 'Hello from test null_resource!'"
  }
}
