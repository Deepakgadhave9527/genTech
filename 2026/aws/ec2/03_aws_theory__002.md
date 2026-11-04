
=========================================================================
## AWS Target Group – Interview Explanation

**Target Group** is a collection of backend resources (targets) that receive traffic from a **Load Balancer**.

### Key Points:

1. **Groups Targets**

   * A target can be:

     * EC2 Instance
     * IP Address
     * Lambda Function

2. **Works with Load Balancer**

   * The Load Balancer forwards incoming requests to the Target Group.
   * The Target Group then routes requests to healthy targets.

3. **Health Checks**

   * The Target Group performs health checks on registered targets.
   * Only healthy targets receive traffic.

4. **Port and Protocol**

   * You define the protocol (HTTP/HTTPS/TCP) and port (e.g., 80, 443, 8080).

### Architecture

```text id="1b0em4"
Users
   |
Application Load Balancer
   |
Target Group
   |
-------------------
|                 |
EC2-1           EC2-2
```

### Interview Answer

> "A Target Group is a collection of backend resources such as EC2 instances, IP addresses, or Lambda functions. The Load Balancer forwards requests to the Target Group, and the Target Group distributes traffic only to healthy targets based on health checks."

=========================================================================

Yes, your understanding is mostly correct. Here's the interview explanation.

### 1. Can we create many Read DBs but only one Write DB?

✅ **Yes.**

* **Primary (Master) DB** → Handles **Read + Write** operations.
* **Read Replicas** → Handle **Read** operations only.

```text
                Application
                     |
          ---------------------
          |                   |
     Write Request       Read Request
          |                   |
      Primary DB       Read Replica 1
                           |
                     Read Replica 2
                           |
                     Read Replica 3
```

---

### 2. Where does Cache sit?

The cache sits **between the application and the database**.

```text
User
  |
Application
  |
Redis / ElastiCache
  |
Primary DB
```

Flow:

* Application first checks the cache.
* If data exists (**Cache Hit**), it returns immediately.
* If not (**Cache Miss**), it fetches from the database and stores the result in the cache.

---

### 3. Can we have multiple Write Replicas?

❌ **No.**

There is only **one writable primary database**.

Read replicas are **read-only**.

---

### 4. If the Primary DB fails and a Read Replica becomes the Primary, will AWS create another Read Replica automatically?

* **Replica promotion:** ✅ Yes (if configured, such as with Amazon RDS Multi-AZ/read replica failover scenarios).
* **Automatically creating a new replacement Read Replica:** ❌ **No.** AWS does not automatically create a new read replica just because one was promoted. You need to create a new read replica yourself if you still want the same number of replicas.

---

### 5. What does Read and Write mean?

**Read (R)** means retrieving data.

Examples:

* `SELECT`

Example:

```sql
SELECT * FROM Employees;
```

**Write (W)** means changing data in the database.

Examples:

* `INSERT` → Add new data
* `UPDATE` → Modify existing data
* `DELETE` → Remove data

Example:

```sql
INSERT INTO Employees VALUES (...);

UPDATE Employees SET Salary = 50000 WHERE Id = 1;

DELETE FROM Employees WHERE Id = 1;
```

### Interview Answer

> "In Amazon RDS, there is one primary database that handles both read and write operations. We can create multiple read replicas to offload read traffic, but they are read-only. A cache like Redis (Amazon ElastiCache) sits between the application and the database to improve performance. If the primary database fails, a read replica can be promoted to become the new primary, but AWS does not automatically create another read replica to replace the promoted one."

=========================================================================
Yes. This is the correct concept. Here's the interview explanation.

---

## VPC and CIDR – Interview Explanation

### What is CIDR?

**CIDR (Classless Inter-Domain Routing)** defines the **IP address range** available in your VPC.

The **size of the network depends on the CIDR block** you choose.

---

### Example 1

```text
VPC CIDR: 10.0.0.0/16
```

* Total IP addresses = **65,536**
* Range:

  ```
  10.0.0.0 → 10.0.255.255
  ```

---

### Example 2

```text
VPC CIDR: 10.0.0.0/24
```

* Total IP addresses = **256**
* Range:

  ```
  10.0.0.0 → 10.0.0.255
  ```

---

### Does the VPC generate IP addresses?

Yes.

The **VPC manages and allocates private IP addresses** to AWS resources such as:

* EC2
* RDS
* Load Balancers
* ECS

These are **private IP addresses**.

---

### Private IP vs Public IP

```text
              AWS VPC
        CIDR: 10.0.0.0/16
               |
          Private IPs
        (10.0.x.x range)
               |
             EC2
               |
      Public IP (Optional)
               |
         AWS Public IP Pool
               |
           Internet
```

* **Private IP**

  * Comes from the VPC CIDR.
  * Used for communication inside the VPC.

* **Public IP**

  * Comes from the **AWS public IP pool**.
  * Assigned only if required (for example, to an EC2 in a public subnet).

---

### Important Interview Point

**Private IP** → Allocated from the **VPC CIDR**.

**Public IP** → Allocated from the **AWS public IP pool**, **not** from the VPC CIDR.

---

## Interview Answer

> "The number of private IP addresses available in a VPC depends on the CIDR block we choose while creating the VPC. The VPC allocates private IP addresses to AWS resources like EC2 and RDS. Public IP addresses are not part of the VPC CIDR; they are assigned from AWS's public IP pool when needed."

### Quick Examples

| VPC CIDR      | Total IP Addresses |
| ------------- | ------------------ |
| `10.0.0.0/24` | 256                |
| `10.0.0.0/16` | 65,536             |
| `10.0.0.0/20` | 4,096              |
| `10.0.0.0/28` | 16                 |

> **Note:** In AWS, **5 IP addresses in every subnet are reserved** by AWS, so not all addresses in the CIDR are usable for your resources. This is a common interview question.

=========================================================================
## Private IP Address Ranges (RFC 1918) – Interview Explanation

There are **3 private IP ranges** that can be used inside a VPC.

| Private IP Range                  | CIDR             | Total IPs     |
| --------------------------------- | ---------------- | ------------- |
| **10.0.0.0 – 10.255.255.255**     | `10.0.0.0/8`     | ~16.7 million |
| **172.16.0.0 – 172.31.255.255**   | `172.16.0.0/12`  | ~1 million    |
| **192.168.0.0 – 192.168.255.255** | `192.168.0.0/16` | 65,536        |

### Example in AWS

When creating a VPC, you can choose a CIDR block from one of these private ranges.

Examples:

```text
10.0.0.0/16
```

```text
172.16.0.0/16
```

```text
192.168.1.0/24
```

These private IPs are used for:

* EC2
* RDS
* ECS
* EKS
* Internal Load Balancers

They **cannot be accessed directly from the internet**.

### Public IP

Public IPs are **not part of these private ranges**. AWS assigns public IPs from its **public IP pool** when needed.

### Interview Answer

> "There are three private IP address ranges defined by RFC 1918: **10.0.0.0/8**, **172.16.0.0/12**, and **192.168.0.0/16**. AWS VPC CIDR blocks are selected from these private ranges, and resources like EC2 and RDS receive private IP addresses from the chosen VPC CIDR."

=========================================================================
## Public IP Address Range – Interview Explanation

Unlike private IPs, **there is no single "public IP series."**

### Public IPs

* Public IP addresses are **globally unique**.
* They are allocated by organizations like **IANA** and **Regional Internet Registries (RIRs)**.
* AWS assigns public IPs from its own **public IP pool**.

Example public IPs:

```text
3.110.25.10
13.232.45.100
18.67.120.5
52.66.150.20
54.169.10.25
```

These are examples only. AWS owns many public IP ranges.

---

## Private vs Public IP

| Private IP                                    | Public IP                         |
| --------------------------------------------- | --------------------------------- |
| Used inside VPC                               | Used on the Internet              |
| Comes from VPC CIDR                           | Comes from AWS public IP pool     |
| Cannot be accessed directly from the Internet | Can be accessed from the Internet |
| Example: `10.0.1.10`                          | Example: `52.66.150.20`           |

---

## Interview Question

**Q: What is the public IP series?**

**Answer:**

> "There is no fixed public IP series like private IPs. Public IP addresses are globally unique and are allocated by IANA and Regional Internet Registries. In AWS, public IPs are assigned from AWS's public IP pool, while private IPs come from the VPC CIDR block."

### Remember

* **Private IP ranges:**

  * `10.0.0.0/8`
  * `172.16.0.0/12`
  * `192.168.0.0/16`

* **Public IP:** Any globally routable IP address outside those private ranges. AWS assigns these automatically (or via an Elastic IP) when required.

=========================================================================

10.0.1.0/24 which net mast value here 24 is right
==
=========================================================================
Yes. **IP addresses must be unique within the same network.**

### Interview Explanation

An **IP address uniquely identifies a device** in a network.

* ✅ Two devices in the **same network/VPC/subnet** cannot have the same IP address.
* ❌ If they have the same IP address, it causes an **IP conflict**, and communication fails.

### Example

```text
VPC: 10.0.0.0/16

EC2-1 → 10.0.1.10
EC2-2 → 10.0.1.11
EC2-3 → 10.0.1.12
```

✅ All IPs are unique.

Incorrect example:

```text
EC2-1 → 10.0.1.10
EC2-2 → 10.0.1.10
```

❌ This creates an **IP address conflict**.

### Can the same private IP exist elsewhere?

✅ Yes.

Private IP addresses can be reused in **different private networks**.

Example:

```text
VPC-1
EC2 → 10.0.1.10

VPC-2
EC2 → 10.0.1.10
```

This is allowed because the VPCs are separate networks.

### Interview Answer

> **"Yes, IP addresses must be unique within the same network or VPC. Two resources in the same network cannot have the same IP address. However, the same private IP can be reused in different VPCs because they are isolated from each other."**


=========================================================================
**Subnet is part of a VPC.** ✅

It **cannot exist outside a VPC**.

### Architecture

```text
AWS Region
    |
    VPC (10.0.0.0/16)
    |
-----------------------------
|                           |
Public Subnet          Private Subnet
10.0.1.0/24            10.0.2.0/24
```

* **VPC** is the main network.
* **Subnets** are smaller networks created **inside** the VPC.
* Every subnet belongs to **one VPC** and **one Availability Zone**.

### Example

VPC CIDR:

```text
10.0.0.0/16
```

Subnets inside the VPC:

```text
Public Subnet  : 10.0.1.0/24
Private Subnet : 10.0.2.0/24
Private Subnet : 10.0.3.0/24
```

All these subnets are part of the same VPC because their CIDR blocks are within the VPC's CIDR range.

### Interview Answer

> **"A subnet is a smaller network created inside a VPC. It cannot exist outside a VPC. Every subnet belongs to one VPC and one Availability Zone, and its CIDR block must be a subset of the VPC's CIDR block."**


=========================================================================
Yes, **the subnet CIDR must be within the VPC CIDR range.** It cannot be outside the VPC.

### Example 1: VPC = `10.0.0.0/28`

A `/28` VPC has only **16 IP addresses**.

```text
VPC: 10.0.0.0/28

IP Range:
10.0.0.0  → 10.0.0.15
```

If your VPC itself is `/28`, you **cannot create a larger subnet** like:

```text
❌ 10.0.0.0/24
```

because `/24` is larger than the VPC.

Also, since the VPC is already the smallest allowed size, you effectively cannot split it into multiple smaller subnets.

---

### Example 2: VPC = `10.0.0.0/16` (Common)

```text
VPC: 10.0.0.0/16

├── Public Subnet  : 10.0.1.0/24
├── Private Subnet : 10.0.2.0/24
├── Private Subnet : 10.0.3.0/24
└── Public Subnet  : 10.0.4.0/24
```

✅ All subnet CIDRs are inside the VPC CIDR.

---

### Invalid Example

```text
VPC: 10.0.0.0/16

Subnet: 192.168.1.0/24
```

❌ Not allowed because `192.168.1.0/24` is outside the VPC CIDR.

---

### Interview Answer

> **"A subnet's CIDR block must always be a subset of the VPC CIDR block. It cannot be outside the VPC range or larger than the VPC itself. For example, if the VPC is `10.0.0.0/16`, valid subnets include `10.0.1.0/24` and `10.0.2.0/24`."**



=========================================================================
This is a common interview question.

### Q: Is a VPC at the Region level or Availability Zone (AZ) level?

✅ **Answer: A VPC is a Region-level resource.**

* One VPC spans the **entire AWS Region**.
* It is **not limited to a single Availability Zone**.

### Example

```text
AWS Region (Mumbai - ap-south-1)
             |
        VPC (10.0.0.0/16)
             |
   --------------------------
   |                        |
Subnet A               Subnet B
AZ-1a                  AZ-1b
```

* **VPC** → Region level ✅
* **Subnet** → AZ level ✅

---

### Interview Points

| Resource         | Scope                               |
| ---------------- | ----------------------------------- |
| VPC              | Region Level                        |
| Subnet           | Availability Zone (AZ) Level        |
| Internet Gateway | Attached to a VPC (Region level)    |
| Route Table      | VPC Level (associated with subnets) |
| Security Group   | VPC Level                           |
| Network ACL      | Subnet Level                        |

### Interview Answer

> **"A VPC is a Region-level resource, meaning it spans the entire AWS Region. Subnets are AZ-level resources, so each subnet belongs to only one Availability Zone. We create multiple subnets in different AZs within the same VPC to achieve high availability."**


=========================================================================



Think of it like this:

### Imagine a City

* **AWS Region** = A city (e.g., Mumbai)
* **Availability Zones (AZs)** = Different areas in that city
* **VPC** = Your private apartment complex in the city
* **Subnets** = Different buildings inside your apartment complex

```text
AWS Region (Mumbai)
        |
     One VPC
        |
  -------------------
  |                 |
Subnet A         Subnet B
(AZ-1a)          (AZ-1b)
```

### Example

Suppose you create:

* **Region:** Mumbai (`ap-south-1`)
* **VPC:** `10.0.0.0/16`

Inside this VPC, you can create:

```text
VPC (10.0.0.0/16)

├── Public Subnet 10.0.1.0/24 → AZ-1a
├── Private Subnet 10.0.2.0/24 → AZ-1a
├── Public Subnet 10.0.3.0/24 → AZ-1b
└── Private Subnet 10.0.4.0/24 → AZ-1b
```

Notice:

* ✅ **One VPC** covers the **entire Mumbai Region**.
* ✅ Inside that VPC, you create **subnets**.
* ✅ Each subnet belongs to **only one AZ**.

### Remember this interview line

* **VPC = Region Level** ✅
* **Subnet = Availability Zone (AZ) Level** ✅

**Easy way to remember:**

* You **create one VPC** in a Region.
* Then you **create multiple subnets** in different AZs inside that VPC.

This is why a VPC can connect resources across multiple Availability Zones, but a subnet cannot.

=========================================================================
This is an excellent interview question. The reason becomes simple if you understand the purpose of each.

### Why is a VPC Region-level?

A **VPC is your entire private network** in AWS.

AWS wants you to use **one network across multiple Availability Zones** so your application stays available if one AZ fails.

Example:

```text
Mumbai Region
        |
     One VPC
   (10.0.0.0/16)
        |
-------------------------
|                       |
AZ-1a               AZ-1b
```

The VPC provides:

* Private IP address range
* Security Groups
* Route Tables
* Internet Gateway

These resources are shared across all AZs in that Region.

---

### Why is a Subnet AZ-level?

A **subnet is a section of the VPC**.

Each Availability Zone has its own physical data center, so AWS places each subnet in **only one AZ**.

Example:

```text
VPC (10.0.0.0/16)

├── Subnet A (10.0.1.0/24) → AZ-1a
└── Subnet B (10.0.2.0/24) → AZ-1b
```

EC2 instances launched in **Subnet A** are physically created in **AZ-1a**.

They cannot be in AZ-1b because a subnet belongs to only one AZ.

---

### Why doesn't AWS allow one subnet across multiple AZs?

Because:

* Each AZ is an **independent physical location**.
* AWS isolates AZs for **fault tolerance**.
* If one AZ fails, only the subnets in that AZ are affected.
* Your application continues running using subnets in the other AZs.

---

### Easy Analogy

Think of a **college**.

```text
College (VPC)

├── Building A (Subnet) → Block A (AZ-1a)
├── Building B (Subnet) → Block B (AZ-1b)
└── Building C (Subnet) → Block C (AZ-1c)
```

* **College = VPC (Region level)**
* **Buildings = Subnets (AZ level)**

One building cannot be in two different blocks at the same time.

---

## Interview Answer (Best)

> **"A VPC is a Region-level resource because it represents the entire private network for that Region. A subnet is an AZ-level resource because it maps to a specific physical Availability Zone. This design enables applications to use multiple subnets across multiple AZs for high availability and fault tolerance."**


=========================================================================




=========================================================================


=========================================================================



**CIDR** stands for **Classless Inter-Domain Routing**.

It is the **`/number`** at the end of an IP address (called the **prefix length**) that tells you how many bits are used for the network portion of the address.

### Examples

- `10.0.0.0/16`
  - CIDR = **16**
  - Network bits = 16
  - Host bits = 32 − 16 = **16**
  - Total IPs = **2¹⁶ = 65,536**

- `192.168.1.0/24`
  - CIDR = **24**
  - Host bits = 32 − 24 = **8**
  - Total IPs = **2⁸ = 256**

- `172.31.0.0/28`
  - CIDR = **28**
  - Host bits = 32 − 28 = **4**
  - Total IPs = **2⁴ = 16**

### Easy Formula

```
Host bits = 32 − CIDR
Total IPs = 2^(Host bits)
```

### Quick CIDR Table

| CIDR | Host Bits | Total IPs |
| ---- | --------: | --------: |
| /16  |        16 |    65,536 |
| /20  |        12 |     4,096 |
| /24  |         8 |       256 |
| /25  |         7 |       128 |
| /26  |         6 |        64 |
| /27  |         5 |        32 |
| /28  |         4 |        16 |

**Simple way to remember:** The number after the slash (`/`) is the **CIDR**. For example, in `10.0.0.0/24`, the CIDR is **24**.

================================================================
One-line formula to memorize:

32 − CIDR = Host Bits
2^(Host Bits) = Total IPs
Total IPs − 5 = AWS Usable IPs

| CIDR  | Calculation        | Total IPs | AWS Usable IPs |
| ----- | ------------------ | --------: | -------------: |
| `/28` | 32 − 28 = 4 → 2⁴   |        16 |             11 |
| `/27` | 32 − 27 = 5 → 2⁵   |        32 |             27 |
| `/26` | 32 − 26 = 6 → 2⁶   |        64 |             59 |
| `/25` | 32 − 25 = 7 → 2⁷   |       128 |            123 |
| `/24` | 32 − 24 = 8 → 2⁸   |       256 |            251 |
| `/23` | 32 − 23 = 9 → 2⁹   |       512 |            507 |
| `/22` | 32 − 22 = 10 → 2¹⁰ |      1024 |           1019 |
| `/21` | 32 − 21 = 11 → 2¹¹ |      2048 |           2043 |
| `/20` | 32 − 20 = 12 → 2¹² |      4096 |           4091 |
| `/19` | 32 − 19 = 13 → 2¹³ |      8192 |           8187 |
| `/18` | 32 − 18 = 14 → 2¹⁴ |     16384 |          16379 |
| `/17` | 32 − 17 = 15 → 2¹⁵ |     32768 |          32763 |
| `/16` | 32 − 16 = 16 → 2¹⁶ |     65536 |          65531 |

=========================================================================

## AWS Reserved IPs (Short Notes)

**AWS reserves 5 IP addresses in every subnet.**

1. **1st IP** → Network address
2. **2nd IP** → VPC Router (Gateway)
3. **3rd IP** → AWS DNS
4. **4th IP** → Future use
5. **Last IP** → Reserved (Broadcast address)

### Easy Memory Trick

**N R D F B**

- **N** = Network
- **R** = Router
- **D** = DNS
- **F** = Future
- **B** = Broadcast (last IP)

### Example (`10.0.1.0/24`)

- `10.0.1.0` → Network
- `10.0.1.1` → Router
- `10.0.1.2` → DNS
- `10.0.1.3` → Future
- `10.0.1.255` → Reserved

**Usable IPs = Total IPs − 5**

**Exam Tip:** **Every AWS subnet reserves 5 IPv4 addresses.**

================================================================
Auto Scaling Group is designed to work across multiple Availability Zones for high availability. When creating an ASG, you specify one or more subnets, and the ASG launches and balances EC2 instances across those subnets. Since each subnet belongs to a specific AZ, the ASG effectively operates across Availability Zones.

=========================================================================
AWS WAF (Web Application Firewall) protects web applications by filtering HTTP and HTTPS requests. It can block attacks such as SQL Injection, Cross-Site Scripting (XSS), bot traffic, and excessive request rates. AWS WAF integrates with services like Application Load Balancer, CloudFront, API Gateway, AppSync, and Cognito.

