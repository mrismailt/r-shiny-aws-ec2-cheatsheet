sudo apt-get update
sudo apt-get install docker
snap install docker
chmod -R 666 /home/nroach44

tinytex::install_tinytex()
tinytex:::is_tinytex()

docker build -t my-shiny-app .

docker run --rm -p 3838:3838 my-shiny-app

https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html



https://stackoverflow.com/questions/28212380/why-docker-container-exits-immediately

docker run -dit ubuntu
After it, I checked for the processes running using:

docker ps -a
For attaching again the container

docker attach CONTAINER_NAME
TIP: For exiting without stopping the container type: ^P^Q
