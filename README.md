# RhythmRoots -- Hybrid E-Commerce Database System

## Overview

RhythmRoots is a hybrid database system that combines **PostgreSQL
(Relational Database)** and **MongoDB (NoSQL Database)** to simulate a
music album e-commerce platform.

The system demonstrates how structured and semi-structured data can
coexist in a real-world application.

PostgreSQL manages transactional data such as users, albums, and orders,
while MongoDB stores flexible document data such as album descriptions,
reviews, and activity logs.

------------------------------------------------------------------------

# System Architecture

MusicBrainz API\
↓\
fetch_albums.py\
↓\
albums.csv\
↓\
PostgreSQL (Structured Data)\
↓\
Python Scripts\
↓\
MongoDB (Document Data)

------------------------------------------------------------------------

# Technologies Used

-   PostgreSQL 15
-   MongoDB 7
-   Docker & Docker Compose
-   Python 3
-   pgAdmin
-   MongoDB Compass
-   pandas
-   pymongo
-   requests
-   psycopg2

------------------------------------------------------------------------

# Project Folder Structure

    RhythmRoots
    │
    ├── postgres-init
    │   ├── 01_schema.sql
    │   ├── 02_users.sql
    │   ├── 03_albums.sql
    │   ├── 04_orders.sql
    │   ├── 05_order_items.sql
    │   ├── users.csv
    │   └── albums.csv
    │
    ├── scripts
    │   ├── fetch_albums.py
    │   ├── populate_mongo.py
    │   └── populate_activity_logs.py
    │
    ├── pgadmin
    │   └── servers.json
    │
    ├── docker-compose.yml
    │
    └── README.md

------------------------------------------------------------------------

# Prerequisites

Before running the project install the following software.

## 1. Install Docker Desktop

Download Docker Desktop:

https://www.docker.com/products/docker-desktop/

Verify installation:

    docker --version
    docker compose version

## 2. Install Python

Install Python 3.10 or newer.

Verify installation:

    python --version

## 3. Install Required Python Libraries

Run:

    pip install pandas pymongo requests psycopg2-binary

------------------------------------------------------------------------

# Step 1 -- Generate Album Dataset

Album data is fetched from the **MusicBrainz API**.

Run the script:

    python scripts/fetch_albums.py

This will generate:

    postgres-init/albums.csv

------------------------------------------------------------------------

# Step 2 -- Start Docker Containers

Run:

    docker compose up -d

Docker will start three containers:

-   rhythmroots_postgres
-   rhythmroots_mongo
-   rhythmroots_pgadmin

Verify:

    docker ps

------------------------------------------------------------------------

# Step 3 -- Automatic PostgreSQL Initialization

PostgreSQL automatically executes SQL scripts located in:

    postgres-init/

Execution order:

    01_schema.sql
    02_users.sql
    03_albums.sql
    04_orders.sql
    05_order_items.sql

These scripts:

-   Create tables
-   Import CSV data
-   Generate sample orders
-   Generate order items

------------------------------------------------------------------------

# PostgreSQL Tables

    users
    albums
    orders
    order_items

------------------------------------------------------------------------

# Step 4 -- Populate MongoDB

Run:

    python scripts/populate_mongo.py

Creates collection:

    album_details

Then run:

    python scripts/populate_activity_logs.py

Creates:

    activity_logs

------------------------------------------------------------------------

# Step 5 -- Access pgAdmin

Open browser:

http://localhost:5050

Login:

Email: jenishborah@gmail.com\
Password: jenish@3116

Navigate:

Servers → RhythmRoots PostgreSQL → Databases → rhythmroots → Schemas →
public → Tables

------------------------------------------------------------------------

# Step 6 -- Verify PostgreSQL Data

Run in pgAdmin Query Tool:

    SELECT * FROM users;
    SELECT * FROM albums;
    SELECT * FROM orders;
    SELECT * FROM order_items;

------------------------------------------------------------------------

# Step 7 -- Verify MongoDB

Open MongoDB Compass and connect:

    mongodb://localhost:27017

Database:

    rhythmroots

Collections:

    album_details
    activity_logs

------------------------------------------------------------------------

# Reset Database

If schema or CSV files change:

    docker compose down -v
    docker compose up -d

------------------------------------------------------------------------

# Hybrid Database Design

## PostgreSQL

Handles:

-   Users
-   Albums
-   Orders
-   Order Items
-   Transactions

Provides **ACID consistency**.

## MongoDB

Handles:

-   Album descriptions
-   Album images
-   Album attributes
-   Reviews
-   Activity logs

Provides **schema flexibility**.

------------------------------------------------------------------------

# Author

Jenish A. Borah\
M.Tech Data Science\
Tezpur University

------------------------------------------------------------------------

# License

Academic project for **Advanced Databases Laboratory Assignment**.
