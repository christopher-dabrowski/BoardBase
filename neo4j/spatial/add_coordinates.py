import pandas as pd

# 1. Load your original dataset
df = pd.read_csv("../data/kaggle/battles.csv")

# 2. Define the coordinate mapping (Lat, Lon)
location_coords = {
    "Castle Black": (61.9, 1.5), "Winterfell": (54.2, -1.5), "Deepwood Motte": (55.5, -4.0),
    "Stony Shore": (54.5, -5.0), "Torrhen's Square": (53.0, -3.0), "Moat Cailin": (50.5, -0.5),
    "The Twins": (48.0, -1.5), "Seagard": (47.5, -2.8), "Green Fork": (47.0, -1.2),
    "Raventree": (46.8, -1.8), "Whispering Wood": (45.8, -2.5), "Riverrun": (45.5, -2.5),
    "Red Fork": (45.2, -2.2), "Mummer's Ford": (44.5, -2.0), "Golden Tooth": (44.0, -3.5),
    "Crag": (44.5, -5.0), "Oxcross": (43.8, -4.2), "Harrenhal": (42.5, -0.5),
    "Darry": (43.0, 0.2), "Ruby Ford": (43.5, 0.0), "Saltpans": (43.2, 0.8),
    "Duskendale": (38.5, 1.8), "King's Landing": (34.5, 2.0), "Dragonstone": (35.2, 3.2),
    "Storm's End": (32.0, 3.0), "Shield Islands": (30.0, -6.0),
}

# 3. Apply coordinates
def get_coords(loc_name):
    if pd.isna(loc_name): return None, None
    if loc_name in location_coords: return location_coords[loc_name]
    if "Ryamsport" in loc_name: return (29.5, -5.8) # Shield Islands area
    return None, None

coords = df['location'].apply(get_coords)
df['latitude'] = coords.apply(lambda x: x[0] if x else None)
df['longitude'] = coords.apply(lambda x: x[1] if x else None)

# 4. Handle the single missing location manually
df.loc[df['name'] == 'Battle of the Burning Septry', 'location'] = 'Riverlands (General)'
df.loc[df['name'] == 'Battle of the Burning Septry', 'latitude'] = 43.5
df.loc[df['name'] == 'Battle of the Burning Septry', 'longitude'] = -2.0

df = df[['name', 'latitude', 'longitude']]

# 5. Save the file
df.to_csv("../data/battles_spatial.csv", index=False)
print("File saved as battles_spatial.csv")
