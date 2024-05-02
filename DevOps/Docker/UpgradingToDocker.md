# Using Docker as part of CI/CD w/ GitHub Actions

* If you have already installed docker on EC2/machine, skip to the build local docker step.
* Assuming you have EC2 running, and can SSH into it, and it's Linux box (still not sure which images are not compatible with linux).
* Your docker image(s) are public.
* This is for the back-end.  For front-end on GH pages, refer to the 'GithubActions_GHPages_AWSEC2.md' file.

## Secret Keys

1. Get new key from dockerhub -> avatar -> account -> security,
2. Add key + username to Github secrets.

## Installing Docker + Running Docker Image

1. Install docker on your +EC2: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04
2. Make sure ```docker images``` or ```docker search shumbum``` can be run without ```su```.
3. Download the target image ```docker image pull shumbum/hello-docker:1.0```.  Replace shumbum/hello-docker with name of public image, and leave ':1.0' if there is no tag (it means the latest).
4. ```docker images``` should now contain your downloaded images.
5. to run a docker image, in the background, with exposed ports:
   * ```docker run -p portOutside:portInDocker -d imageName:tag```
   * ex: ```docker run -p 5000:8080 -d shumbum/hello-docker:1.0```
   * ```d``` means detached, ```p``` means to publish or map specific ports.
6. To stop docker container, ```docker stop my_container_id```.  Ex: ```docker stop 91faf1d209a5 ```

## Build Local image + Deploy to docker hub

* Assuming node application is simple.  More complex BE = more configuration

1. Copy Dockerfile and .dockerignore to root project
2. Build LOCAL image by: ```docker build -t IMAGE_NAME```.  Replace image-name with your app name.  The '.' at the end = use this directory as build context.
3. Test run the docker image: ```docker run -d -p 5000:8080 --name CONTAINER_NAME IMAGE_NAME```.
4. When satisfied, create a repo on DockerHub:
   1. Login to dockerhub, go to Repo.
   2. Create a repo, fill out details (I usually keep name and repo name the same).
5. Tag image with your docker USERNAME and REPO name: ```docker tag IMAGE_NAME USER_NAME/REPO:TAG```.  The tag could be '1.0' or 'latest'.
6. Login: ```docker login```.
7. Finally push the image: ```docker push USER_NAME/REPO:TAG```
8. Verify on dockerhub.  Note: searching via CLI may not show the tag/image right away.

## Configuring GitHub Actions

1. Copy ci_docker.yml file and put into Github actions folder of repo.
2. Configure as necessary.  Note context means folder where the Dockerfile lives.  In the example repo, it's in backend.  ```context: ./backend```.

<!-- TODO add the SSH to EC2 actions, reference deploy script + update the deploy script -->

# Useful commands:

- Start docker container: ```docker run -p portOutside:portInDocker -d imageName:tag```
- Stop docker container: ```docker stop my_container_id```
- List all docker processes: ```docker ps```
  - list all processes that have exised as well, add ``` -a```
- To list all ports being listened to on machine, regardless if it's from pm2, docker, etc: ```netstat -tuln```


# Notes:
* Docker builds images, which are local.  However, they are associated as tags which represent different versions or configurations when uploaded to the repo.
* ```docker image pull ``` and ```docker pull``` are interchangeble.