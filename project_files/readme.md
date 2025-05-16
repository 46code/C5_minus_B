## Data Processing  
- **File Renaming**:  
  - Use `file_rename.py` to rename PNG image files according to the provided instructions.  
  - Process ground truth files with `exportilluminantsToJson.m` and `writeAll.m` for JSON formatting.  

## Data Augmentation  
To expand camera sensor samples (listed in the **Data Augmentation** section of the main README):  
1. Download the base images from [this Google Drive link](https://drive.google.com/file/d/1ylf1AnjcdNBbSINS4t6rlfb5U2RJeKQT/view?usp=sharing).  
2. Generate synthetic images and ground truth files using `data_aug.py`.  

## Compatibility Note  
For **PyTorch 1.8+**, use the provided `c5.py` script for with Bias network.  

## Angular Error Calculation  
Compute angular error metrics between predicted and ground truth illuminants using `angular_err.m`:  
- Mean, median, min, max, and standard deviation of angular error.  

## Models  
The `project_files/models/` directory contains six trained models. To test:  
1. Place your chosen model in the `models/` directory.  
2. Follow testing instructions in the main README.  

⚠️ **Important**: Ensure scripts are placed in the correct directories (as specified in the README) for proper execution.  
