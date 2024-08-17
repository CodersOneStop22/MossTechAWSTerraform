output "instance_ids" {
  description = "IDs of all instances"
  value       = aws_instance.example.*.id
}


