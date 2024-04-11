variable "libvirt_disk_path" {
  description = "path for libvirt pool"
  default     = "/srv/storage/kvm"
}

variable "ubuntu_23_img_url" {
  description = "ubuntu 18.04 image"
  # default     = "http://cloud-images.ubuntu.com/releases/bionic/release-20191008/ubuntu-18.04-server-cloudimg-amd64.img"
  default     = "https://cloud-images.ubuntu.com/releases/23.04/release/ubuntu-23.04-server-cloudimg-amd64.img"
}

variable "vm_hostname" {
  description = "vm hostname"
  default     = "terraform-kvm-ansible"
}

variable "ssh_username" {
  description = "the ssh user to use"
  default     = "ubuntu"
}

variable "ssh_private_key" {
  description = "the private key to use"
  default     = "~/.ssh/id_ed25519"
}
