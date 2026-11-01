

### Step 1 — Switch to root user

- Command:
             `sudo su -`
- Explanation: Switches to the root user with administrator privileges.

### Step 2 — Install Git

- Command:
             `yum install git -y`
- Explanation: Installs Git to download source code from a repository.

### Step 3 — Clone the repository

- Command:
             `git clone <repo>`
- Explanation: Downloads the project code from the specified Git repository.

### Step 4 — Navigate to the project directory

- Command:
             `cd <project-directory>`
- Explanation: Moves into the downloaded project folder.

### Step 5 — Install Python pip

- Command:
             `yum install python3-pip -y`
- Explanation: Installs pip to manage and install Python packages.

### Step 6 — Install Python dependencies

- Command:
             `pip3 install -r requirements.txt`
- Explanation: Installs all Python libraries listed in the `requirements.txt` file.

### Step 7 — Install MariaDB packages

- Command:
             `yum install mariadb105-server -y`
- Explanation: Installs the MariaDB database server package if it is available for your Linux version.

### Step 8 — Connect to the AWS database

- Command:
             `mysql -h <database-endpoint> -u <database-username> -p`
- Explanation: Connects to the AWS database using its endpoint and username and prompts for the password.

### Step 9 — Run the Python script

- Command:
             `python3 cache.py`
- Explanation: Executes the `cache.py` script to perform the tasks defined in the Python code.

Note: For Amazon Linux 2023, use `dnf` if `yum` commands are unavailable or incompatible. If you're using Amazon RDS, you generally need a database client rather than installing a database server on EC2.







======================


## Inbound Rules for Common Cloud and Server Setups

1. Linux SSH Access

- Port: `22`
- Protocol: TCP
- Source: Your public IP only

2. Windows RDP Access

- Port: `3389`
- Protocol: TCP
- Source: Your public IP only

3. Website HTTP

- Port: `80`
- Protocol: TCP
- Source: `0.0.0.0/0` (if publicly accessible)

4. Website HTTPS

- Port: `443`
- Protocol: TCP
- Source: `0.0.0.0/0` (if publicly accessible)

5. MySQL Database

- Port: `3306`
- Protocol: TCP
- Source: Application server/security group only

6. PostgreSQL Database

- Port: `5432`
- Protocol: TCP
- Source: Application server/security group only

7. MongoDB Database

- Port: `27017`
- Protocol: TCP
- Source: Application server/security group only

8. Redis Cache

- Port: `6379`
- Protocol: TCP
- Source: Private network/application servers only

9. Kubernetes API

- Port: `6443`
- Protocol: TCP
- Source: Authorized administrator IPs or networks

10. Custom Application

- Port: Your application's configured port
- Protocol: TCP or UDP, depending on the application
- Source: Only required clients or networks

Important: Do not expose SSH, RDP, databases, or administrative services to the entire internet unless there is a specific, secured reason.
