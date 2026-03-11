# This script reads albums.csv and creates MongoDB album_details documents
# so that MongoDB stays synchronized with PostgreSQL albums table.

import pandas as pd
from pymongo import MongoClient
from datetime import datetime
import random

# connect to MongoDB container
client = MongoClient("mongodb://localhost:27017/")

# select database
db = client["rhythmroots"]

# select collection
collection = db["album_details"]

# read albums dataset
df = pd.read_csv("postgres-init/albums.csv")

documents = []

for _, row in df.iterrows():

    reviews = []

    # generate random reviews
    for r in range(random.randint(1,3)):

        reviews.append({
            "user_id": random.randint(1,20),
            "rating": random.randint(3,5),
            "comment": "Nice album",
            "timestamp": datetime.utcnow()
        })

    doc = {

        "album_id": int(row["album_id"]),

        "description": f"{row['title']} by {row['artist']}",

        "images": [
            "cover1.jpg",
            "cover2.jpg"
        ],

        "attributes": {
            "genre": row["genre"],
            "format": "Digital"
        },

        "reviews": reviews

    }

    documents.append(doc)

# insert documents
collection.insert_many(documents)

print("MongoDB album_details populated successfully")