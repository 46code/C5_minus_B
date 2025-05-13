clc
clear
close all

% Load the data files
load('filenames.mat');
load('gt.mat');        
load('results.mat');  

% Normalize ground truth and predicted vectors to unit length
gt_normalized = gt ./ vecnorm(gt, 2, 2);
predicted_normalized = predicted ./ vecnorm(predicted, 2, 2);

% Compute dot product between corresponding vectors
dot_product = sum(gt_normalized .* predicted_normalized, 2);

% Clip values to handle numerical inaccuracies
dot_product = max(min(dot_product, 1), -1);

% Calculate angular errors in degrees
angular_errors = acosd(dot_product);

% Compute performance statistics
mean_error = mean(angular_errors);
median_error = median(angular_errors);
min_error = min(angular_errors);
max_error = max(angular_errors);
std_error = std(angular_errors);

% Display results
disp('==================================================');
disp('Performance Summary:');
fprintf('Mean Angular Error: \t%.2f°\n', mean_error);
fprintf('Median Angular Error: \t%.2f°\n', median_error);
fprintf('Minimum Error: \t\t%.2f°\n', min_error);
fprintf('Maximum Error: \t\t%.2f°\n', max_error);
fprintf('Standard Deviation: \t%.2f°\n', std_error);
disp('==================================================');