# ssh-copy-id 

su - root

apt update
apt upgrade
apt install sudo

# gets password promt
usermod -aG sudo debian 

debian  ALL=(ALL) NOPASSWD:ALL

%sudo  ALL=(ALL) NOPASSWD: ALL

# extra ansible recipes to apply
- pure
- node_exporter