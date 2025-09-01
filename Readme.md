# Jenkins + BlueOcean Setup with Docker Compose

This project builds and runs a custom **Jenkins with BlueOcean** setup using Docker Compose.  
It installs Jenkins, BlueOcean, and Docker CLI inside the container, so Jenkins pipelines can interact with Docker.

---

## Installation

### 1. Clone this repository and navigate into it
```bash
git clone https://github.com/Gilbert-Mutai/Jenkins-on-Docker
cd Jenkins-on-Docker

```

### 2. Build and Start Jenkins

```
docker compose up -d --build

```
### 3. Check Logs
```
docker compose logs -f jenkins-blueocean

```
### 4. Get Initial Admin Password
```
docker exec -it jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword

```

### 5. Connect to the Jenkins
```
https://localhost:8080/
```

### 6. Installation Reference
```
https://www.jenkins.io/doc/book/installing/docker/
```

### 7. alpine/socat container to forward traffic from Jenkins to Docker Desktop on Host Machine
```
docker run -d --restart=always -p 127.0.0.1:2376:2375 --network jenkins -v /var/run/docker.sock:/var/run/docker.sock alpine/socat tcp-listen:2375,fork,reuseaddr unix-connect:/var/run/docker.sock
docker inspect <container_id> | grep IPAddress
```
### 8. Using my Jenkins Python Agent

```
docker pull gmutai/jenkins-agent:latest

```