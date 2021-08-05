# ssh-copy-id 

su - root

apt update
apt upgrade
apt install sudo

# gets password promt
usermod -aG sudo temp

temp  ALL=(ALL) NOPASSWD:ALL