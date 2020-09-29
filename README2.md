sudo apt-get update
sudo apt-get install docker
snap install docker
chmod -R 666 /home/nroach44

tinytex::install_tinytex()
tinytex:::is_tinytex()

docker build -t my-shiny-app .

docker run --rm -p 3838:3838 my-shiny-app
