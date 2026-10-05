# Docker-Personal-Web-Server

# STEP 1: Writing Dockerfile
<------------------------------------------------------------->
FROM ubuntu:latest 
-> Taking ubuntu base image for running container
RUN apt update && apt install nginx -y 
-> Updating & installing nginx
ADD index.html /var/www/html/index.html 
-> Copying my custom index.html file to nginx root directory
CMD ["nginx","-g","daemon off;"] 
-> Starting nginx service & telling nginx not to run on the background so that we can access nginx later using doxker exec
<------------------------------------------------------------->

# STEP 2: Build a custom image from Dockerfile
docker build -t custominage . 
-> Here "customimage" is our image name & . means docker file is in our present owrking directory. 

# STEP 3: Runnung a container from custom image
docker run -dt --name=customcontainer -p 80:80 customimage 
-> Here -dt stands for docker running on detachable mode, which means docker will not hold the terminal & will go background aster runnung it, -p 80:80 means we are mapping host port 80 : container port 80 so that if we curl localhostIP:80 we will able to access the nginx service running on the container from our host machine

# STEP 4: Now lets inspect the container & see it's logs
docker inspect customcontainer 
-> This will show all the configurations of the container
docker logs customcontainer 
-> This will show all the logs that been genareted by the container

# STEP 5: Changing the restart policy
docker inspect customcontainer | grep -i -2 restartpolicy 
-> By this will see the restart policy set to the container is "no", which means the container will turned off if the docker engine restart
docker update --restart=always customcontainer 
-> This will set the restart policy to always thus the container will kept running no matter what the docker engine state.  
