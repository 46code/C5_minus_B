import os

from aug_ops import set_sampling_params, map_raw_images

# Define the default parameters
params = set_sampling_params()

# Define the target cameras
target_cameras = [
    'Canon EOS-1Ds Mark III',
    'Fujifilm X-M1',
    'Nikon D40',
    'Olympus E-PL6',
    'Samsung NX2000'
    #'Sony SLT-A57'
]

# Specify the input and output directories
xyz_img_dir = 'images_lr'
output_dir = 'augmented_data_2' 

# Ensure output directory exists
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# Run the augmentation
map_raw_images(
    xyz_img_dir=xyz_img_dir,
    target_cameras=target_cameras,
    output_dir=output_dir,
    params=params
)