# R Shiny AWS EC2 Cheatsheet
## R Shiny running on AWS EC2 with https, SSL, and custom domain name, all without spending a dime!

### Purpose
I often have host webapplications I build for my clients on a server for easy access on their end. This in and of itself is a process. However, it doesn't look very nice sending them a long AWS Public DNS address or a bunch of numbers in the form of a Public IP address. So I've often had to acquire free domain names to make the deliverable more appealing. Sometimes, clients require webapps to be embeded into their websites. Since people rarely build websites from scratch anymore, most website builders do not allow iframe's referencing insecure addresses. This forces us to https secure the webapps we send our clients! This too can be done for free. Below is the cleaned up and nicely formatted version of a notepad document I had prepared for myself. I hope that by making this public I may ease the work of others as well!

### Note
I will not be going in to details that are obvious! This is only intended is a cheatsheet for crucial information that one has to look up everytime

### Setting up an AWS EC2 R Shiny instance:

#### Server Used

Ubuntu Server 20.04 LTS (HVM), SSD Volume Type - ami-02ae530dacc099fc9

Ubuntu Server 20.04 LTS (HVM),EBS General Purpose (SSD) Volume Type. Support available from Canonical (http://www.ubuntu.com/cloud/services).
Root Device Type: ebs Virtualization type: hvm

#### AWS Related Stuff ([article](https://towardsdatascience.com/how-to-host-a-r-shiny-app-on-aws-cloud-in-7-simple-steps-5595e7885722))
	
- SSH - My IP
- Custom TCP - 3838 - Anywhere
- "Load" .pem and "Save private key" as .ppk using PuTTYgen
- Elastic IP

#### Installing r

`sudo apt-get update`

`sudo apt-get install r-base`

`sudo apt-get install r-base-dev`

#### Installing shiny package
		
`install.packages("shiny")`

##### Possible errors
		
- Need httpuv? `sudo apt-get install r-cran-httpuv`
- Need Rcpp ubuntu 16? `sudo apt-get install r-cran-rcpp`

<!--
/*https://www.r-bloggers.com/install-shiny-server-for-r-on-ubuntu-the-right-way/
	sudo apt-get install -y libcurl4-openssl-dev 
	sudo apt-get install -y libxml2-dev
	sudo apt-get install -y openjdk-7-jdk
	export LD_LIBRARY_PATH=/usr/lib/jvm/java-7-openjdk-	amd64/jre/lib/amd64/server
	sudo R CMD javareconf*/
-->

#### Shiny server install ([link](https://rstudio.com/products/shiny/download-server/ubuntu/))

`sudo apt-get install gdebi-core`

`wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.14.948-amd64.deb`

`sudo gdebi shiny-server-1.5.14.948-amd64.deb`

#### Permissions

`sudo chmod 777 /srv/shiny-server`

<!--#sudo chmod -R 777 /srv-->
`sudo mkdir /srv/shiny-server/myapp`

`sudo chmod 777 /etc/shiny-server`

<!--#sudo chmod -R 777 /etc-->
<!--	#shiny-server.conf
		#location /myapp {
		#site_dir /srv/shiny-server/myapp;-->

#### Install packages

- dbplyr problem? update tibble
- shinymanager problem ubnutu 16? no openssl? sudo apt-get install libssl-dev
- pdftools problem ubuntu 16? no libcurl4-openssl-dev? `sudo apt-get install libcurl4-openssl-dev`
- no poppler-cpp? `sudo add-apt-repository -y ppa:cran/poppler`

	`sudo apt-get update`
		
	`sudo apt-get install -y libpoppler-cpp-dev`
		
- RPostgres problem? no libpq? `sudo apt-get install libpq-dev`

### Apache2 Web Server ([article](https://www.r-bloggers.com/shiny-https-securing-shiny-open-source-with-ssl/))

1. Generate a key: `openssl genrsa -out /etc/ssl/private/apache.key 2048`
1. Create our SSL certificate: `openssl req -new -x509 -key /etc/ssl/private/apache.key -days 365 -sha256 -out /etc/ssl/certs/apache.crt`
1. Install apache:
    `apt-get install apache2`
    
	  `aptitude install -y build-essential`
    
	  `aptitude install -y libapache2-mod-proxy-html libxml2-dev`
    
		- no aptitude? `apt install aptitude`
		- no package that matches libapache2-mod-proxy-html? `a2enmod proxy_html`
    
			`systemctl restart apache2`
      
		  or it is already there under another name so just run `aptitude install -y libxml2-dev`
      
	apache installed. To install ssl and proxy modules in apache: `a2enmod`
  
	type the following: `ssl proxy proxy_ajp proxy_http rewrite deflate headers proxy_balancer proxy_connect proxy_html`
		
    `systemctl restart apache2`

1. Configure apache to forward https calls to http port 3838: `nano /etc/apache2/sites-enabled/000-default.conf`

`	<VirtualHost *:*>
	 SSLEngine on
	 SSLCertificateFile /etc/ssl/certs/apache.crt
	 SSLCertificateKeyFile /etc/ssl/private/apache.key
	
	 ProxyPreserveHost On
	 ProxyPass / http://0.0.0.0:3838/
	 ProxyPassReverse / http://0.0.0.0:3838/

	 ServerName localhost
	</VirtualHost>`
  
This turns on SSL for apache server, pointing to the certificate

Forwards all incoming https calls to http port 3838

1. Restart apache: `service apache2 restart`

### Free domain name: [freenom.com](freenom.com)

### Real SSL certificate: [Certbot (Let's Encrypt)](https://certbot.eff.org/lets-encrypt/ubuntufocal-apache)

### Routing 80 to 443 ([article](https://serverfault.com/questions/803776/serving-port-443-over-http-creates-400-bad-request-error-instead-of-redirect))

<VirtualHost *:80>

    -- snip --

    RewriteEngine On
    RewriteCond %{HTTPS} off
    RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [R,L]

</VirtualHost>


<VirtualHost *:443>

    -- snip --

    SSLEngine on
    SSLCertificateFile /var/www/ssl/STAR_iconcierge_net_au.crt
    SSLCertificateKeyFile /var/www/ssl/STAR_iconcierge_net_au.key
    SSLCertificateChainFile /var/www/ssl/STAR_iconcierge_net_au.crt

</VirtualHost>
