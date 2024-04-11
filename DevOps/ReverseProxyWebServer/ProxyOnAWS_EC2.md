# Creating a Webserver as a Reverse Proxy (with SSL)

Using:

* AWS EC2
* Nginx
* nip.io

## Steps

Rough steps can be found here: https://yhuh.medium.com/how-to-easily-host-your-express-server-on-https-without-a-domain-name-dccd92b2438d

1. Launch EC2 Instance, free tier, Ubuntu.  Make sure security policy accepts 443 and 80 (http and https).
2. **Install nginx**
    1.  Update the Debian repository information: ```sudo apt-get update```
    2.  Install the NGINX Open Source package: ```sudo apt-get install nginx```
    3.  Verify the installation: ```sudo nginx -v```
3. Install Certbot: ```sudo snap install --classic certbot```
4. Prepare cerbot command: ```sudo ln -s /snap/bin/certbot /usr/bin/certbot```
5. Allow certbot to get cert and make changes to you nginx: ```sudo certbot --nginx```
      * the domain name is your IP address with all '.' replaced with '-', suffixed with .nip.io  Ex: **12-345-678-90.nip.io**
      * take note of the location of the key and cert.
6.  Modify the nginx conf file (see example below), and fill out the routes, server name, etc.
7.  Don't forget to remove the duplicated server_name in .conf files.
      * Search by going: ```grep -r 'ip_address_here.nip.io' /etc/nginx/``
      * They could be in conf files like ```/etc/nginx/sites-available```
8. Test validity of nginx conf: ```sudo nginx -t```
9. Restart nginx: ```sudo systemctl restart nginx```

## Useful Commands

SSH into a EC2 instance (while certificate in same dir as command):

```bash
ssh -i "name_of_cert.pem" ubuntu@ec2-ip-address.us-west-2.compute.amazonaws.com
```

Restarting nginx:

```bash
sudo systemctl restart nginx
```

Stopping nginx:

```bash
sudo systemctl stop nginx
```

Editing nginx config:

```bash
sudo nano /etc/nginx/nginx.conf
```

## Sample Config File

```bash
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        # multi_accept on;
}

http {

        ##
        # Basic Settings
        ##

        sendfile on;
        tcp_nopush on;
        types_hash_max_size 2048;
        # server_tokens off;

        # server_names_hash_bucket_size 64;
        # server_name_in_redirect off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ##
        # SSL Settings
        ##

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        ##
        # Logging Settings
        ##

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        ##
        # Gzip Settings
        ##

        gzip on;

        # gzip_vary on;
        # gzip_proxied any;
        # gzip_comp_level 6;
        # gzip_buffers 16 8k;
        # gzip_http_version 1.1;
        # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

        ##
        # Virtual Host Configs
        ##

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;

        ##
        # Your Server Block for Reverse Proxying
        ##

        server {
            listen 443 ssl;
            server_name 54-202-195-30.nip.io;

            ssl_certificate /etc/letsencrypt/live/54-202-195-30.nip.io/fullchain.pem;
            ssl_certificate_key /etc/letsencrypt/live/54-202-195-30.nip.io/privkey.pem;

            #A Painting Company HTTP API
            location /apc/ {
                rewrite ^/apc(/.*)$ $1 break;
                proxy_pass http://54.188.20.64:3000$uri;
            }

            location /app1/ {
                rewrite ^/app1(/.*)$ $1 break;
                proxy_pass http://www.example.com;
            }

            location / {
                proxy_pass http://www.example.com;
            }

            # Add other locations as needed for additional applications
        }
}
```

## Notes:

Certificates and key from LetsEncrypt generally stored here:

```bash
/etc/letsencrypt/live/server_-_name_here/fullchain.pem
```
```bash
/etc/letsencrypt/live/server_-_name_here/privkey.pem
```

Adding a new route with the provided example:

```conf
#picks up whatever is after the name of the api, then stores it in $1...
# and that somehow....becomes the $uri
location /newServiceName/ {
	rewrite ^/newServiceName(/.*)$ $1 break;
	proxy_pass http://location_of_api:port$uri
}
```