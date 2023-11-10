resource "aws_secretsmanager_secret" "my_secret" {
  name = "json-encoded-secret"
}

resource "aws_secretsmanager_secret_version" "my_secret_version" {
  secret_id = aws_secretsmanager_secret.my_secret.id
  secret_string = jsonencode({
    username = "my_username",
    password = "my_password123",
    email    = "my_email@email.com"
  })
}