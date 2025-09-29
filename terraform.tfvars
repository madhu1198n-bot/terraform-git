instance_type = "t2.micro"
ami = "ami-03f4878755434977f"
bucket = "test-ec2-bucket-me-you-174ghdj"
key_name = "ec2_keys"
file_name = "C:/Users/USER/OneDrive/Documents/keys/ec2_keys.pem"
private_key = "C:/Users/USER/OneDrive/Documents/keys/ec2_keys.pem"
commands = [# Update & dependencies
      "sudo apt-get update -y",
      "sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common",

      # Add Docker GPG key & repo
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable'",

      # Install Docker
      "sudo apt-get update -y",
      "sudo apt-get install -y docker-ce",

      # Start & enable Docker
      "sudo systemctl start docker",
      "sudo systemctl enable docker",

      # Test installation
      "docker --version",
      "sudo docker run hello-world",

      # Allow user to run Docker without sudo
      "sudo usermod -aG docker ubuntu"]

source_path = "C:/Users/USER/OneDrive/Documents/pythonque.docx"
destinantion_path = "/home/ubuntu/python_question.txt"
user_name = "ubuntu"