resource "null_resource" "test" {
provisioner "local-exec" {
command = "echo 'Hello from fmt test'"
}
}
