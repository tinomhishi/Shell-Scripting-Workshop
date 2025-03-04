
# Shell Scripting For DevOps and Automation

  

## **Introduction**

Batch (Windows) and Bash (Unix Based Systems)Scripting (Shell scripting) are essential tools for DevOps engineers and software developers to automate repetitive tasks efficiently. This workshop will highlight the basics of Shell Scripting.

  

### **1. Defining Shell Scripting**

A method for automating command line tasks for sysadmin, devops and automated deployments.

  

-  **Bash v Batch - Key differences**

-  **Bash**: For Unix Based Systems and supports advanced scripting (functions, loops).

-  **Bash Files**: Use *.sh* file extensions.

-  **Batch**: For Windows based systems supports less advanced scripting. Advanced functionality moved to powershell.

-  **Batch Files**: Use *.bat* filex extentions.

  

**Common Use Cases**

1.  **SysAdmin and Maintenance**

- Resource Monitoring.

- Log Rotation and Cleaning.

- User Management

2.  **Dev and Version Control**

- Environment Setups.

- Automated Testing.

- Automated Deployments.

3.  **File and Data Management**

- Sync Local and Remote Management. `rsync`

- File organization.

- File conversion. Automated text encoding.

- Removing duplicate files.

4.  **Network Security and Administration.**

- Automated SSH logins. `sshpass` used to auto-login and execute commands.

- Checking server uptime. Pinging and logging responses.

- SSL Certificate expiring check.

- Firewall & Port Scanning. Port Scanning using `nmap`. Automation of `iptables` rules.

5.  **Webscraping and API Automation.**

- Automated API requests.

- Scraping Url data. `wget`, `curl`/

  

### **2. Bash Scripting Basics**

-  **Shebang** - This line defines the interpreter. Ensures the correct interpreter is used: `#! /bin/bash`

-  **Shebanh Alternatives** - `#!/usr/bin/env bash`

-  **Variables** - Setting value to VAR. To check run:

-  `VAR=value`  `echo $VAR`


```
SERVER_IP="192.168.1.1"

echo "Connecting to server at $SERVER_IP..."
```

-  **User Input** - Accept input from user: `read`

  

### **Control Flow:**

- Used to implement conditional execution: `if`, `elif`, `else`

- Used for iterations: `for`, `while`

- Handling multiple conditions: `case`

**Functions**: syntax: `do_something () {}`

**File Ops**:

- Create file named help.txt: `touch help.txt`

- Add text to file: `echo "Line 1">> help.txt`

- Print contents of file: `cat help.txt`

- Rename file: `mv help.txt helper.txt`

- Delete file: `rm helper.txt`

- Example

```

if [ -r "file.txt" ]; then

echo "file.txt is readable."

fi #  Marks the end of an if block

```

**Error Handling**

- Manage exceptions: `set -e`, `trap`

  

### **Sample Bash Script**

- This script will delete all files with .log file extensions older than 7 days.

```

#!/bin/bash

LOG_DIR="/var/log/myapp"

find "$LOG_DIR" -type f -name "*.log" -mtime +7 -exec rm {} \;

echo "Old logs cleaned up!"

```

  

### **Batch Scripting Basics**

-  **Disable Command Echo** - Prevents users from seeing the commands for cleaner output-`@echo off`

-  **Set Variables** - Set and print out variable VAR- `set VAR=value`, `echo %VAR%`

-  **User Input** - Get user input - `set /p varname=Enter value:`

-  **Control Structures**:

-  `if`, `goto`, `for`, `choice`.

-  **Functions (using `call`)**.

-  **File Operations (`echo`, `type`, `del`, `move`)**.

-  **Error Handling (`@echo on`, `2>NUL`)**.

  

### **Sample Batch Script**

```

#!/bin/bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$BRANCH" = "main" ]; then

echo "Deploying to production..."

git pull origin main

systemctl restart myapp.service

else

echo "Not on main branch, skipping deployment."

fi

```

  

## **Further Reading**

### Bash

- Linux Command Line and Shell Scripting Bible - Richard Blum & Christine Bresnahan

- The Linux Command Line - Shots

- Cheat Sheet https://devhints.io/bash

### Batch

- Windows Command Line Administrator’s Pocket Consultant - William R. Stanek

- Windows Batch Scripting - T.Hill

  

### More Use Cases

- https://github.com/go-prime/restaurant/blob/main/run_uvicorn.sh

  

```

#!/bin/bash

  

# Load environment variables from .env file if it exists

if [ -f .env ]; then

export $(cat .env | xargs)

fi

  

# Use the SITE_NAME from the environment variable or default to 'restaurant.pos'

SITE_NAME=${SITE_NAME:-restaurant.pos}

  

# Use the PORT from the environment variable or default to 8000

PORT=${PORT:-3000}

  

# Ensure the necessary environment variables are set

if [ -z "$SITE_NAME" ]; then

echo "SITE_NAME is not set. Exiting..."

exit 1

fi

  

if [ -z "$PORT" ]; then

echo "PORT is not set. Exiting..."

exit 1

fi

  

echo "Running Uvicorn with SITE_NAME: $SITE_NAME on PORT: $PORT"

  

# Run Uvicorn server with the environment variables for the site name and port

uvicorn restaurant.fast_api_main:app --host 0.0.0.0 --port $PORT --reload

```

  

- https://github.com/go-prime/cd_server/blob/master/install.sh

  

```

#!/usr/bin/bash

  

git clone https://github.com/go-prime/cd_server

  

cd cd_server

  

python3 -m venv env

source env/bin/activate

pip install -r requirements.txt

# for old versions of python

pip install python-dotenv requests pyyaml flask redis rq flask-dotenv

mkdir logs

  

chmod u+x src/server.py

chmod u+x src/build_process.py

chmod u+x src/test_app.py

chmod u+x install.py

  

python install.py

  

sudo cp supervisor/* /etc/supervisor/conf.d/

  

sudo supervisorctl reread

sudo supervisorctl reload

sudo supervisorctl restart all

```