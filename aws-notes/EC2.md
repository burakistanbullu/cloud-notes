# EC2 (Elastic Compute Cloud)

## What is EC2? Why Do We Use It? What Are EC2 Instance Types?

**What is EC2?**

The name EC2 comes from the initials of “Elastic Compute Cloud.”
It is AWS’s virtual server (virtual machine) service.

If an AWS service includes the word “elastic,” it means that the service is scalable.

**Why Do We Use EC2?**

-   *To reduce management overhead* ➜ OS upgrades, security issues, new server provisioning, datacenter maintenance and operations.

-   *To lower costs* ➜ With the pay-as-you-go model, we can shut down servers when they are not in use and reduce expenses (e.g., shutting down batch servers at night).

**EC2 Instance Types**

-   General (Balanced CPU-memory) ➜ Suitable for enterprise applications (e.g., payment systems).
-   Compute Optimized (CPU-intensive) ➜ Suitable for CI/CD runners (Jenkins) and compute-heavy applications.
-   Memory Optimized (High Memory) ➜ Suitable for caching (Redis) and database workloads.
-   Accelerated Computing (GPU) ➜ Suitable for machine learning applications.
-   Storage Optimized (SSD/IOPS) ➜ Suitable for log processing (Elasticsearch), high-performance databases (Cassandra), and Big Data analytics (Hadoop, Spark).

## Creating an EC2 Instance, Installing Jenkins, and Accessing It from the Outside World

**Creating an EC2 Instance**

-   On the EC2 / Instances page, click “Launch Instances.”
-   Fill out the required fields on the screen:
    -   Name: instance name
    -   OS image: choose operating system (we selected Ubuntu)
    -   Instance type: CPU, RAM resources of your server
    -   Key pair (login): Click “Create new key pair”, give a name, keep defaults (RSA and .pem), and click Create key pair. The private key will be downloaded to your computer.
        -   What is this?
            -   It’s the combination of private + public key we use to connect to the instance.
            -   Public key is stored by AWS, private key (.pem) is downloaded to your machine. This is why the private key must never be shared.

    -   Click “Launch Instance” to create the instance.
-   To connect, take the Public IP of the instance and run from your computer:

    ```bash
    ssh -i .\aws_login.pem ubuntu@13.61.179.67
    ```


-   Note : (Here, aws_login.pem is the private key downloaded to your computer, and ubuntu is Ubuntu’s default user.)

**Installing Jenkins on the Server**

1. Install Java JDK
    ```bash
    sudo apt update
    sudo apt install fontconfig openjdk-21-jre
    java --version
    ```

2. Install Jenkins
    ```bash
    sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian/jenkins.io-2023.key

    echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian binary/" | sudo tee \
    /   etc/apt/sources.list.d/jenkins.list > /dev/null

    sudo apt update
    sudo apt install jenkins
    ```

3. Check if the service is running:
    ```bash
    systemctl status jenkins
    ```

**Accessing Jenkins from the Outside World**

-   By default, an instance has no inbound access except via SSH.
Jenkins runs on port 8080, so we must add an Inbound Rule.

-   In the AWS console, click your instance → go to the Security tab → open the Security groups.

-   Under Inbound rules, click Edit inbound rules and add:

    -   Type: Custom TCP
    -   Port range: 8080
    -   Source: Anywhere

-   Test access in your browser: http://13.61.179.67:8080/
