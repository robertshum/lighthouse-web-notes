# Github Actions to deploy Front-end (to Github Pages) and Back-end (to AWS EC2)

## Prerequisites

* AWS EC2 instance deployed and running, with git and node installed.
* SSH to EC2 working.
* Reverse proxy enabled with HTTPS for endpoints (to forward back end requests to the http server).

## General Steps

1. Log into your EC2 instance: ```ssh -i "name_of_cert.pem" ubuntu@ec2-ip-address.us-west-2.compute.amazonaws.com```
2. Install pm2: ```npm install pm2 -g```
3. Create a script for pm2 to run when starting the application (See ecosystem.json).
   1. In EC2, run: ```touch ecosystem.json```
   2. Copy and edit the values from the example.
4. Create deployment script (See deploy.sh).
   1. In EC2, run: ```touch deploy.sh```
   2. Copy and edit the values from the example.
5. Test the scripts manually.
   1. Clone/pull your app from github.
   2. run: ```sh deploy.sh```
   3. It should stop any pm2 process with the application name, rebuild the project, then run.
   4. Test the app endpoint(s).
6. Enable GH Pages for front-end and create Actions:
   1. Configure the secrets on the repo (make sure to use environment ones to match the ones in the static.yml) 
   2. Go to repo > settings > pages
   3. Source = GitHub Actions
   4. Static HTML > Configure (Configure Github Actions.)
   5. Either create a ```.github/workflows``` folder, then place a workflow .yml file inside (see static.yml), or just paste and configure the static.yml from previous step.
   6. Save.
   7. Make another change and push against main, or manually run the workflow.
7. Pray everything works first try.

## Notes

* These steps based off of: https://dev.to/lukasborawski/node-js-app-deployment-with-aws-pm2-and-github-actions-31o2
* Might be a better idea to run Docker in the future and rely less on PM2, as PM2 is made for node apps.  With Docker, we can start and deploy different types of back-end apps without worrying about if it's a node vs. bootstrap vs. .Net, etc.