resource "null_resource" "null" {
  # SSH connection to unmanaged EC2
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/USER/OneDrive/Downloads/kube-worker.pem")
    host        = "PUBLIC_IP_OF_INSTANCE"  # Replace with your EC2 public IP
  }

  # 1️⃣ Copy the PEM file to EC2
  provisioner "file" {
    source      = "C:/Users/USER/Downloads/kube-worker.pem"
    destination = "/home/ubuntu/kubew.pem"
  }

  # 2️⃣ Change file permissions on EC2
  provisioner "remote-exec" {
    inline = ["chmod 400 /home/ubuntu/kubew.pem"]
  }

  # 3️⃣ Run a local command (on your machine)
  provisioner "local-exec" {
    command = "cat C:/Users/USER/Downloads/kube-worker.pem"
  }

  # Optional: re-run every apply (useful for testing)
  triggers = {
    always_run = timestamp()
  }
}
