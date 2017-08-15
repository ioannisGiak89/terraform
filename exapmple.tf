variable "do_token" {}

provider "digitalocean" {
    token = "${var.do_token}"
}

resource "digitalocean_droplet" "web" {
   count = 1
   image  = "ubuntu-16-04-x64"
   name   = "tf-do-web-${count.index}"
   region = "fra1"
   size   = "512mb"
   ssh_keys = ["${var.do_sshKey}"]
}
