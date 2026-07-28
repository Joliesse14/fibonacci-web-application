# Fibonacci Web Application

A Docker-based web application developed as part of the **Vernetzte Systeme** course at Bremerhaven University of Applied Sciences.

The application calculates Fibonacci numbers through a web interface and demonstrates containerized web development using Docker. It also showcases load balancing, caching, database integration, and performance testing in a distributed system.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Performance Testing](#performance-testing)
- [Project Structure](#project-structure)
- [Authors](#authors)
- [License](#license)

---

## Project Overview

The Fibonacci Web Application is a distributed web application that computes Fibonacci numbers. The system is deployed using Docker containers and demonstrates concepts of distributed systems, including web services, caching, load balancing, and database integration.

---

## Features

- Calculate Fibonacci numbers through a web interface
- Store calculation requests in a MariaDB database
- Redis caching for improved performance
- HAProxy load balancing
- Background worker for asynchronous processing
- Docker-based deployment
- Performance testing using ApacheBench

---

## Technology Stack

- PHP
- MariaDB
- Redis
- Docker
- Apache
- HAProxy
- Bash
- ApacheBench
- Gnuplot

---

## Architecture

The application consists of multiple Docker containers:

- Apache Web Server
- MariaDB Database
- Redis Cache
- HAProxy Load Balancer
- Background Worker

---

## Prerequisites

Before running the project, make sure the following software is installed:

- Docker
- Git
- Bash

---
## Installation

Clone the repository:

```bash
git clone https://github.com/Joliesse14/fibonacci-web-application.git
```

Navigate to the project directory:

```bash
cd fibonacci-web-application
```

Build and start all Docker containers:

```bash
for i in apache worker redis mariadb haproxy; do
    (cd docker-$i && ./bin/build-and-run.sh)
done
```

---

## Usage

After all Docker containers have started successfully, open the application in your web browser using the configured address (for example, `http://localhost:8080` or the deployment URL provided by your environment).

Enter a positive integer and submit the form to calculate the corresponding Fibonacci number.

---

## Performance Testing

Run performance tests using ApacheBench, for example:

```bash
ab -n 1000 -c 50 http://localhost:8080/
```

The generated results can be visualized with Gnuplot.

---

## Project Structure

```text
docker-vns-2025-e/
├── bin/                  # Build and utility scripts
├── common/               # Shared configuration
├── docker-apache/        # Apache container
├── docker-haproxy/       # HAProxy container
├── docker-mariadb/       # MariaDB container
├── docker-redis/         # Redis container
├── docker-worker/        # Background worker
└── README.md
```

---

## Authors

Developed as part of the **Vernetzte Systeme** course at **Bremerhaven University of Applied Sciences**.

---

## License

This project was developed for educational purposes.
