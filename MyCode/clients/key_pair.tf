resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "Iko_us_west_2"       # Create a "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.kp.key_name}.pem"
  content = tls_private_key.pk.private_key_pem
}

resource "aws_ssm_parameter" "secret" {
  name        = "SSH_Key"
  description = "SSH PEM key"
  type        = "SecureString"
  value       = tls_private_key.pk.private_key_pem

  tags = {
    environment = "production"
  }
}
