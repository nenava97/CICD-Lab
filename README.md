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
- Use the following script to update the EC2 instance"
```
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install openjdk-11-jre-headless -y
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \ /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \ https://pkg.jenkins.io/debian-stable binary/ | sudo tee \ /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install jenkins -y
```
- After installing Jenkins, copy the password which you will need to enter when visit Jenkins in browser at localhost:8080
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
```

3. Observe Dockerfile 
- In addition to creating a Docker image for your application, how does it interact with DockerHub?  

4. Build application pipeline.
- In Jenkins click on new item and create new multibranch (?) pipeline 
- Under Branch Source add source "GitHub", under Credentials add "Jenkins" and under username enter GitHub username and under password enter GitHub access token created in Step 1.
- Enter forked repository url and validate
- Ensure Build Configuration says Jenkinsfile
- Apply and Save
- Select Scan repository if build doesn’t automatically start creating

Questions to think about:
What additional step(s) can be added to improve the continous integration and continous deployment of this application? Hint: GitHub tools, IaC tools, management tools, etc. Where and how would they be integrated. 
