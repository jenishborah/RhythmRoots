# 🎵 RhythmRoots – Hybrid E-Commerce Database System

A hybrid database system combining **PostgreSQL (Relational Database)** and **MongoDB (NoSQL Database)** to simulate a **music album e-commerce platform**.

The project demonstrates how modern applications integrate **structured transactional data** with **flexible document-based metadata** using a hybrid database architecture.

---

## 🚀 Features

- Hybrid **SQL + NoSQL** architecture
- **PostgreSQL** for transactional data (Users, Albums, Orders)
- **MongoDB** for flexible metadata (Descriptions, Reviews, Activity Logs)
- **Docker-based deployment**
- Automatic **database initialization**
- Data ingestion using **MusicBrainz API**
- Clean **microservice-like architecture**
- Easily reproducible environment

---

## 🛠 Technologies Used

| Technology | Purpose |
|------------|--------|
| PostgreSQL | Relational transactional database |
| MongoDB | Document database for flexible data |
| Docker | Containerized deployment |
| Python | Data ingestion & synchronization |
| pgAdmin | PostgreSQL GUI |
| MongoDB Compass | MongoDB GUI |

---

## 🏗 System Architecture

MusicBrainz API
      │
      ▼
 fetch_albums.py
      │
      ▼
 albums.csv
      │
      ▼
 PostgreSQL (Transactional Data)
      │
      ▼
 Python Integration Scripts
      │
      ▼
 MongoDB (Album Metadata + Activity Logs)
 
---

![Docker](https://img.shields.io/badge/Docker-Containerized-blue)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Relational_DB-blue)
![MongoDB](https://img.shields.io/badge/MongoDB-NoSQL-green)
![Python](https://img.shields.io/badge/Python-3.x-yellow)
![License](https://img.shields.io/badge/License-Academic-lightgrey)

---
