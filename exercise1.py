import requests
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sqlalchemy import create_engine, text

import os
from kaggle.api.kaggle_api_extended import KaggleApi


url = "https://www.kaggle.com/datasets/gauravpathak1789/yellow-tripdata-2020-01" 
#we dont need to put params as we need do it for json files and it is csv file.

os.environ['KAGGLE_USERNAME'] = "hemantchaudhary933"
os.environ['KAGGLE_KEY'] = "84b036fbd5a1039d9b5d201e2984cf77"

# Download the dataset using Kaggle API
# os.system('kaggle datasets download -d gauravpathak1789/yellow-tripdata-2020-01 --unzip -p ./data')
 
# Find the CSV file (adjust filename if needed)
csv_path = 'C:/Users/Hemant.Chaudhary/Desktop/data/yellow_tripdata_2020-01 (1).csv'
 
# Load data
df = pd.read_csv(csv_path)
print(df.head())
#4. Clean Data
# Remove invalid fares or distances
df_clean = df[(df["fare_amount"] > 0) & (df["trip_distance"] > 0)]

#5. Transformations
# Add new column: fare per mile
df_clean["fare_per_mile"] = df_clean["fare_amount"] / (df_clean["trip_distance"] + 0.1)

#6. Aggregation
# Group by passenger count and calculate average distance and fare
agg_df = df_clean.groupby("passenger_count")[["trip_distance", "fare_amount"]].mean().reset_index()
print("After aggregation of data:",agg_df)

#7. Visualization with Matplotlib
# Bar plot: Avg fare per passenger count
plt.figure(figsize=(8, 5))
plt.bar(agg_df["passenger_count"], agg_df["fare_amount"], color="skyblue")
plt.xlabel("Passenger Count")
plt.ylabel("Average Fare")
plt.title("Average Fare by Passenger Count")
plt.show()

# Scatter plot: Trip Distance vs Fare
plt.figure(figsize=(8, 5))
plt.scatter(df_clean["trip_distance"][:5000], df_clean["fare_amount"][:5000], alpha=0.3)
plt.xlabel("Trip Distance")
plt.ylabel("Fare Amount")
plt.title("Fare vs Distance (Sample 5k)")
plt.show()