
====================================================

# 1. Install Git
sudo yum install git -y

# 2. Update packages
sudo dnf update -y

# 3. Install Java 21
sudo dnf install java-21-amazon-corretto-devel -y

# 4. Verify Java
java -version

# 5. Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

# 6. Import Jenkins key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# 7. Install Jenkins
sudo dnf install jenkins -y

====================================================


# Start Jenkins
sudo systemctl start jenkins

# Enable Jenkins at system startup
sudo systemctl enable jenkins

# Check Jenkins status
sudo systemctl status jenkins

====================================================
pipeline :  stage view


====================================================


hen enable comment is means server backgorund run never stop for tommor and start means it will wxperired or stop some time

No, not exactly. Let me explain with a simple example.

Imagine you start Jenkins today at 10 AM.

### 1. `start` means RUN NOW

bash

```bash
sudo systemctl start jenkins
```

- Jenkins starts running in the background immediately.
- It continues running even if you close your terminal.
- It does NOT automatically stop after some time.
- But if you restart your EC2 server, Jenkins won't automatically start again unless it is enabled.

### 2. `enable` means AUTOMATIC START AFTER REBOOT

bash

```bash
sudo systemctl enable jenkins
```

- It tells Linux to start Jenkins automatically whenever the EC2 server boots.
- It does not start Jenkins immediately.
- It does not mean Jenkins runs forever without interruption.

### Real-time example

| Situation | Only start | Only enable |
| --- | --- | --- |
| Jenkins starts now | Yes | No |
| Close terminal | Keeps running | No effect |
| Reboot EC2 | Won't auto-start | Auto-starts |
| Runs continuously | Yes, until stopped | Depends on whether started |

### Easy way to remember

- `start` = Switch ON now.
- `enable` = Automatically switch ON whenever the server starts.

In real projects, we generally use both:

bash

```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

This starts Jenkins now and configures it to start automatically after future server reboots.


====================================================



Jenkins requires Java to run.


Jenkins is a Java-based application, so a Java Runtime Environment (JRE) or Java Development Kit (JDK) must be installed on the server.

Why Java 21?
Jenkins runs on the Java platform.

Java 21 is supported by current Jenkins releases.

Installing java-21-amazon-corretto-devel provides Java 21 JDK on Amazon Linux.

Jenkins uses Java to start and run its server process.



====================================================




====================================================









====================================================




====================================================




====================================================