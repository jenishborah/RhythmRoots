import pandas as pd
import random
from datetime import datetime
from pymongo import MongoClient

# connect MongoDB
client = MongoClient("mongodb://localhost:27017/")
db = client["rhythmroots"]

collection = db["activity_logs"]

# read album ids from CSV
df = pd.read_csv("postgres-init/albums.csv")

album_ids = df["album_id"].tolist()

activity_docs = []

for user_id in range(1, 6):   # 5 users

    actions = []

    for _ in range(3):   # each user performs 3 actions

        actions.append({
            "type": random.choice([
                "VIEW_ALBUM",
                "ADD_TO_CART",
                "PURCHASE_ALBUM"
            ]),
            "album_id": random.choice(album_ids),
            "timestamp": datetime.now(),
            "details": "User interaction with album"
        })

    activity_docs.append({
        "user_id": user_id,
        "actions": actions
    })

collection.insert_many(activity_docs)

print("activity_logs populated successfully")