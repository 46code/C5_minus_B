import os

# Configuration (change these)
camera_model = "NikonD40"  # Camera model name
directory = "PNG"               # Path to PNG folder from base directory
start_number = 1                # Starting sequence number

# Get all PNG files and rename
png_files = [f for f in os.listdir(directory) if f.lower().endswith(".png")]
for idx, filename in enumerate(png_files, start=start_number):
    seq = f"{idx:04d}"
    new_name = f"image_{seq}_sensorname_{camera_model}.png"
    os.rename(
        os.path.join(directory, filename),
        os.path.join(directory, new_name)
    )