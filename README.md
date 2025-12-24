# DNS, DHCP & Proxy Server Implementation using Docker

## 📘 Project Overview
This repository presents a comprehensive implementation of three fundamental network services — **DNS**, **DHCP**, and **Proxy (Squid)** — using **Docker containerization technology**.  
The project is developed as part of the **IE4030 – Virtualization & Cloud Computing Technologies** module at **Sri Lanka Institute of Information Technology (SLIIT)**.

The main objective of this project is to demonstrate how traditional network infrastructure services can be efficiently virtualized, deployed, managed, and tested using Docker and Docker Compose. By containerizing these services, the solution achieves portability, scalability, isolation, and simplified management compared to traditional bare-metal or VM-based deployments.

---

## 🎯 Objectives
- Implement DNS, DHCP, and Proxy servers using Docker containers  
- Demonstrate container-based deployment of network services  
- Validate functionality using real-world testing scenarios  
- Showcase Docker Compose as a service orchestration tool  
- Align implementation with academic and industry best practices  

---

## 🛠 Technologies Used
- **Docker & Docker Compose** – Containerization and orchestration  
- **BIND9** – DNS Server  
- **ISC DHCP Server** – Dynamic IP allocation  
- **Squid Proxy** – HTTP/HTTPS proxy server  
- **Ubuntu 22.04 / Debian Bullseye** – Base operating systems  
- **Docker Hub** – Image hosting and distribution  

---

## 📂 Project Structure
```
vcct/
├── dns/
│   ├── Dockerfile
│   ├── named.conf.options
│   ├── named.conf.local
│   └── db.csne.vcct.com
│
├── dhcp/
│   ├── Dockerfile
│   └── dhcpd.conf
│
├── proxy-server/
│   ├── Dockerfile
│   ├── squid.conf
│   └── entrypoint.sh
│
├── docker-compose.yml
└── README.md
```

---

## 🖼 Architecture Overview
The architecture consists of three Docker containers running on a single host system using host networking mode:
- DNS container handles domain name resolution  
- DHCP container dynamically assigns IP addresses  
- Proxy container filters and forwards web traffic  

All architecture diagrams and screenshots should be stored in the **images/** directory.

---

## 🚀 Prerequisites
Ensure the following software components are installed:

- Docker  
- Docker Compose  
- Linux-based Operating System (Ubuntu recommended)

Verify installation:
```
docker --version
docker compose version
```

---

## 🔐 Docker Hub Images
| Service | Docker Image |
|-------|--------------|
| DNS | bhugz/dns-bind:v1 |
| DHCP | bhugz/dhcp-isc:v1 |
| Proxy | bhugz/proxy-squid:v1 |

---

## ⬇️ Pull Images from Docker Hub
```
docker pull bhugz/dns-bind:v1
docker pull bhugz/dhcp-isc:v1
docker pull bhugz/dhcp-isc:v1
docker pull bhugz/proxy-squid:v1
```

---

## ▶️ Running Containers Individually

### DNS Server
```
sudo docker run -d --name dns   --net=host   --cap-add=NET_ADMIN   --restart unless-stopped   bhugz/dns-bind:v1
```

### DHCP Server
> Replace `ens37` with the correct network interface of your system.
```
sudo docker run -d --name dhcp   --net=host   --cap-add=NET_ADMIN   --restart unless-stopped   bhugz/dhcp-isc:v1   sh -c "dhcpd -4 -f -d -cf /etc/dhcp/dhcpd.conf ens37"
```

### Proxy Server
```
sudo docker run -d --name proxy   --net=host   --cap-add=NET_ADMIN   --restart unless-stopped   bhugz/proxy-squid:v1   sh -c "squid -N -f /etc/squid/squid.conf -d 1"
```

---

## 🐳 Deployment Using Docker Compose (Recommended)
Docker Compose simplifies service orchestration by allowing all services to be started, stopped, and managed using a single configuration file.

Start services:
```
sudo docker compose up -d
```

Check status:
```
sudo docker compose ps
```

View logs:
```
sudo docker compose logs --tail 50
```

Stop services:
```
sudo docker compose down
```

---

## 🧪 Verification & Testing

### Check running containers
```
docker ps
```

### DNS Resolution Test
```
dig @192.168.8.2 csne.vcct.com
```

### DHCP Lease Test
```
sudo dhclient -v ens37
```

### Proxy Server Test
```
curl -I --proxy 192.168.8.2:3128 http://example.com
```

---

## 📸 Evidence & Screenshots
All verification outputs and screenshots must be placed in the **images/** directory, including:
- Container status outputs  
- DNS resolution results  
- DHCP lease allocation  
- Proxy access validation  
- Docker Compose logs  

---

## 🎓 Academic Details
- **Module:** IE4030 – Virtualization & Cloud Computing Technologies  
- **Student Name:** B. S. Premathilaka  
- **Registration Number:** IT22218926  
- **Institute:** Sri Lanka Institute of Information Technology (SLIIT)  

---

## 📄 License
This project is developed strictly for **academic and educational purposes only**. Redistribution or commercial use is not permitted.
