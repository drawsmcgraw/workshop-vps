resource "digitalocean_droplet" "workshop-droplet" {
  image = "centos-8-x64"
  name = "workshop"
  region = "nyc3"
  size = "16gb"
  ssh_keys = [var.ssh_keypair_id]

  # Copy in the bash script we want to execute.
  # The source is the location of the bash script
  # on the local linux box you are executing terraform
  # from.  The destination is on the new AWS instance.
  provisioner "file" {
    source      = "user_data.sh"
    destination = "/tmp/user_data.sh"
  }

  # Change permissions on bash script and execute from ec2-user.
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/user_data.sh",
      "sudo bash /tmp/user_data.sh",
    ]
  }

  # Login to the ec2-user with the aws key.
  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(var.pvt_key)
    host        = self.ipv4_address
  }
}