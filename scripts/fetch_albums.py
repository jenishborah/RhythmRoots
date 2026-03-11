import requests
import pandas as pd

url = "https://musicbrainz.org/ws/2/release"

params = {
    "query": "rock",
    "fmt": "json",
    "limit": 50
}

headers = {
    "User-Agent": "RhythmRootsProject/1.0"
}

response = requests.get(url, params=params, headers=headers)

data = response.json()

albums = []
album_id = 1

for r in data.get("releases", []):

    title = r.get("title", "Unknown")

    artist = "Unknown"
    if "artist-credit" in r:
        artist = r["artist-credit"][0]["name"]

    release_date = r.get("date", "Unknown")
    country = r.get("country", "Unknown")
    status = r.get("status", "Official")

    albums.append({
        "album_id": album_id,
        "title": title,
        "artist": artist,
        "release_date": release_date,
        "country": country,
        "status": status,
        "price": 15.99,
        "stock_quantity": 50,
        "genre": "World Music"
    })

    album_id += 1

df = pd.DataFrame(albums)

df.to_csv("postgres-init//albums.csv", index=False)

print("albums.csv created successfully with enhanced metadata")