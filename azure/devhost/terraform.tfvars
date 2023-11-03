# note some variables are set in env.sh to ensure consistency between terraform components
vm_name = "vm0"
vm_user = "kris"
vm_size = "Standard_B2s"
ssh_src1 = "76.250.81.157"
ssh_src1name = "5702HB"
ssh_src2 = "37.247.51.34"
ssh_src2name = "Noisy"
pubkey1_file = "ssh_kt-imac17.pub"
pubkey2_file = "ssh_kt-mbpro20.pub"
pubkey3_file = "ssh_kt-noisy.pub"

# VM Image
image_publisher = "Canonical"
image_offer = "0001-com-ubuntu-server-jammy"
image_sku = "22_04-lts-gen2"