### Launch Instance

Amazon Linux 2 AMI (HVM), SSD Volume Type
(User: ec2-user)

### Generate Private Key and Allocate Elastic IP

### Create Security Rules

SSH - My IP
HTTP - Anywhere

### [Install Docker](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html)

`sudo yum update -y`

`sudo amazon-linux-extras install docker`

`sudo service docker start`

`sudo usermod -a -G docker ec2-user`

Log out and back in

`docker info`

====

sudo apt-get update

sudo apt-get install docker

snap install docker

chmod -R 666 /home/nroach44

tinytex::install_tinytex()

tinytex:::is_tinytex()

docker build -t my-shiny-app .

docker run --rm -ditp 3838:3838 my-shiny-app

https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html



https://stackoverflow.com/questions/28212380/why-docker-container-exits-immediately

docker run -dit ubuntu
After it, I checked for the processes running using:

docker ps -a
For attaching again the container

docker attach CONTAINER_NAME
TIP: For exiting without stopping the container type: ^P^Q
