variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

resource "aws_security_group" "dynamic_security_group" {
  name        = "dynamic_security_group"
  description = "Dynamic Security Group for Inbound and Outbound Rules"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = [
      { from_port = 8080, to_port = 9000, protocol = "tcp", description = "Allow app-specific TCP ports" },
      { from_port = -1, to_port = -1, protocol = "icmp", description = "Allow ping requests" },
      { from_port = 22, to_port = 22, protocol = "tcp", description = "Allow SSH connection" },
      { from_port = 443, to_port = 443, protocol = "tcp", description = "Allow HTTPS traffic (public)" },
      { from_port = 80, to_port = 80, protocol = "tcp", description = "Allow HTTP traffic (public)" },
      { from_port = 53, to_port = 53, protocol = "udp", description = "Allow DNS over UDP" }
    ]
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
      description = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound traffic" },
      { from_port = 0, to_port = 0, protocol = "icmp", description = "Allow ping responses" },
      { from_port = 22, to_port = 22, protocol = "tcp", description = "Allow SSH outbound" },
      { from_port = 80, to_port = 80, protocol = "tcp", description = "Allow HTTP outbound" },
      { from_port = 443, to_port = 443, protocol = "tcp", description = "Allow HTTPS outbound" }
    ]
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
      description = egress.value.description
    }
  }
}

output "dynamic_security_group_id" {
  value = aws_security_group.dynamic_security_group.id
}
