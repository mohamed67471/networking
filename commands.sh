

# Check file permissions of your private key
ls -l nginx-key.pem

# Secure the private key permissions
chmod 400 nginx-key.pem

# (Optional) Move key to a secure folder
mkdir -p ~/temp-key-dir
mv nginx-key.pem ~/temp-key-dir/

# SSH into your EC2 instance
ssh -i ~/temp-key-dir/nginx-key.pem ec2-user@13.61.183.177

# Update packages on EC2 (Amazon Linux 2)
sudo yum update -y

# Install NGINX web server
sudo amazon-linux-extras install nginx1 -y

# Start NGINX service
sudo systemctl start nginx

# Enable NGINX to start on boot
sudo systemctl enable nginx

# (Outside terminal) Open port 80 in EC2 Security Group via AWS Console

# (Outside terminal) Add A record in Cloudflare DNS:
# nginx.mohamed-group.org → 13.61.183.177 (DNS only)

# (Outside terminal) Test by opening http://nginx.mohamed-group.org in browser
