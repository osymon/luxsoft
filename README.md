# luxsoft
!!!This repository deploy two ec2-instance with nginx docker conteiner which displays in the bowser the greeting and the public IP of the servers.

1. create ec2-instance with IAM Role (policy:AmazonEC2FullAccess) and key.pem for admin (save key.pem on your local PC)
2. connect to this ec2-instance and update packages
sudo dnf update
3. install epel,ansible,boto,boto3,git:


sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
sudo dnf makecache
sudo dnf install ansible -y
sudo pip3 install boto boto3
sudo dnf install git -y

4. clone git repository
git clone https://github.com/osymon/luxsoft.git
5. copy key.pem or create them

cp key.pem /home/ec2-user/luxsoft/ansible/

6. change permission

chmod 400 key.pem

7. check remote_user and private_key_file in ansible.cfg
8. change your public ip in launch_config_ec2.yml (cidr_ip:) for сorrect execution playbook
9. start playbook

ansible-playbook launch_config_ec2.yml

10. copy the public ipv4 dns of the installed servers into the browser and check results  
