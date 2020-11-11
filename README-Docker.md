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

`sudo yum install git -y`  
`git clone <git-repo> App`

#### Update Repo

`cd App`
`git pull`

#### Remove Repo

`rm -rf`

### Docker

#### Build Image

[Dockerfile](https://github.com/mrismailt/r-shiny-aws-ec2-docker-cheatsheet/blob/master/Dockerfile)

`docker build -t my-shiny-app App`  
`docker images`

#### Run Image

`docker run --rm -ditp 80:3838 my-shiny-app`  
`docker ps`



====

tinytex::install_tinytex()

tinytex::is_tinytex()

https://stackoverflow.com/questions/28212380/why-docker-container-exits-immediately

docker run -dit ubuntu
After it, I checked for the processes running using:

docker ps -a
For attaching again the container

docker attach CONTAINER_NAME
TIP: For exiting without stopping the container type: ^P^Q

docker logs <container_id>
For error logs
https://sematext.com/blog/docker-logs-location/#:~:text=First%20of%20all%2C%20to%20list,use%20the%20docker%20ps%20command.&text=Then%2C%20with%20the%20docker%20logs,logs%20for%20a%20particular%20container.&text=Most%20of%20the%20time%20you,the%20last%20few%20logs%20lines.
