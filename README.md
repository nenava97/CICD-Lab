# CICD-Lab
This lab will display a CI/CD pipeline that utilizes Git, Jenkins and Docker. 

Requirements:
A server that is able to have Jenkins installed, with an AWS account a free-tier EC2 can be made to host a Jenkins Controller.

Steps:

1. Fork this GitHub repository and create GitHub personal access token. 
- Navigate to GitHub settings, select developer
settings, select personal access token and create new token. 
- Select a 30 day expiration and the following scopes: repo and admin:repo_hook. 

2. Install and configure Jenkins controller on EC2 instance.
- Use the following script to update the EC2 instance.
```
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install openjdk-11-jre-headless -y
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \ /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \ https://pkg.jenkins.io/debian-stable binary/ | sudo tee \ /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install jenkins -y
```
- After installing Jenkins, copy the password which you will need to enter when visit Jenkins in browser at localhost:8080.
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
```
3. Install and set up Jenkins agent in other EC2. 
- Use the previous script to update the EC2 instance.
- Create a Jenkins agent profile/nodes for the Docker serverthat will launch agents via SSH and only build jobs with label expressions matching the node in the Jenkinsfile.

4. Observe Dockerfile 
- In addition to creating a Docker image for your application, how does it interact with DockerHub?  

5. Build application pipeline.
- In Jenkins create new multibranch (?) pipeline with GitHub Branch Source and the forked repository url.

Questions to think about:
What additional step(s) can be added to improve the continous integration and continous deployment of this application? Hint: GitHub tools, IaC tools, management tools, etc. Where and how would they be integrated. 
