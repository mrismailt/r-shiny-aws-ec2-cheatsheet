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

### Git

#### Install

`sudo yum install git -y`

#### Clone Repo

`git clone <git-repo> App`

#### Update Repo

`cd App`

`git pull`

#### Remove Repo

`rm -rf`

### Docker

#### Build Image

`docker build -t my-shiny-app App`

`docker images`

#### Run Image

`docker run --rm -ditp 80:3838 my-shiny-app`

`docker ps`



====

tinytex::install_tinytex()

tinytex:::is_tinytex()

https://stackoverflow.com/questions/28212380/why-docker-container-exits-immediately

docker run -dit ubuntu
After it, I checked for the processes running using:

docker ps -a
For attaching again the container

docker attach CONTAINER_NAME
TIP: For exiting without stopping the container type: ^P^Q
