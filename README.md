
## Enocean IoTC Auto-Deployment

This repo contains files that automatically deploys Enocean IoTC stack which is made up of three(3) containerized software namely; ingress controller, Engine, and API. Additionally a message broker and cache (redis), and a Proxy for security (Nginx). This is meant for customers that operate in the linux environment that wish to automate the deployment of the IoTC stack.


## Documentation

[Read the proper docs here](https://iotconnector-docs.readthedocs.io/)


## Environment Variables

A .env file have been provided with the needed environment variables so you just need to supply the values.

`IOT_LICENSE_KEY`

`IOT_AUTH_CALLBACK`

`IOT_GATEWAY_USERNAME`

`IOT_GATEWAY_PASSWORD`

`BASIC_AUTH_USERNAME`


## Deployment

Prior to deploying the stack, there are some basic things that are needed, they include;
1. Licence key which can be gotten [here](https://www.enocean.com/en/products/tools-kits-iot-software/enocean-iot-connector/#trial-version)
2. Basic personal Details such as usernames and passwords (to be configured in ".env file")
3. An ssl certificate.

### STEP 1
Clone the github repo

```bash
  git clone https://github.com/Joshua-Igoni/Enocean-solution.git
```
the repo contains all files neccesary to deploy the solution.

### STEP 2

```bash
  cd Enocean-solution/deploy/local_deployment
  
  nano .env
```
This opens up a an environment variable file where you can put in all the details which include your desired username and passwords, Licence key, your call_back URL (your local IP), and others.

### STEP 3

Go back to the root directory in the repo and make script executable

```bash
  cd ../..
  
  chmod +x deploy.sh
```
### STEP 4

Run the script with the following command;

```bash
  ./depoy.sh
```
The shell script updates the system binaries and packages, installs docker and docker-compose, creates an ssl certificate (script will prompt you to provide details during runtime), and runs the "docker-compose up" command to deploy IoTC stack.

### NOTE:

The shell script is designed to automatically provision an ssl certificate.
However, if you have an already signed certificate, you have to follow the following steps before deploying the solution.

There are basically two cryptograhic keys needed, *.crt and *.key.
for this solution to work you must comment out "line 9-11" in the shell script "deploy.sh"
rename your keys to "dev.localhost.crt" and "dev.localhost.key"

Place the renamed keys in the following directory in the cloned repo

```bash
  Enocean-solution/deploy/nginx/
```

### Post Deployment

After IoTC stack has been successfully deployed, you can procceed to https://your_ip:443 to onboard your devices