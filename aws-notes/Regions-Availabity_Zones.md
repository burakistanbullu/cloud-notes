# Region

**What is a Region?**

An AWS region is a *geographical area* where AWS data centers are located.

-   Each region is a *completely independent* AWS infrastructure.

-   Example: us-east-1 → North Virginia (USA), eu-west-1 → Ireland

An AWS region code is structured like this ➡ continent-direction-number 
➡ us-east-1

Each region contains its own resources (EC2, S3, RDS, etc.).
-   Meaning: An EC2 instance you create in Frankfurt cannot automatically access an S3 bucket in Virginia unless you explicitly allow it.

**Factors Affecting Region Selection**

When choosing an AWS region, you should consider four key factors:

-   *Latency* : Select a region close to your users for better performance.

-  *Compliance / Data Residency* : Some data must stay within certain countries (e.g., GDPR).

-   *Service Availability* : Not every AWS service is available in every region (e.g., some AI services are only available in the US).

-   *Cost* : Prices vary by region (e.g., Virginia is generally cheaper).

# Availability Zone

**What is an Availability Zone (AZ)?**

A region consists of multiple Availability Zones (AZs). *These are physical data centers within the same region.*

-   A region = like a city
-   AZs = separate data centers within that city

Example: eu-central-1 (Frankfurt) Region
-   Contains AZs such as eu-central-1a and eu-central-1b.

Each Availability Zone:
-   Has its own power, cooling, and network infrastructure.
-   Is connected to other AZs with low-latency fiber networks.
-   Enables High Availability by allowing deployments across multiple AZs.
