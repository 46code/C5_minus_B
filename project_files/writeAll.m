% Set the folder where the .mat files are located
matFilesFolder = pwd; % <- or specify a folder path like 'C:/path/to/your/files'

% Find all .mat files in the folder
matFiles = dir(fullfile(matFilesFolder, '*.mat'));

% Check if there are any .mat files
if isempty(matFiles)
    error('No .mat files found in the specified folder.');
end

% Process each .mat file
for k = 1:length(matFiles)
    matFilePath = fullfile(matFiles(k).folder, matFiles(k).name);
    fprintf('Processing: %s\n', matFiles(k).name);
    
    try
        exportIlluminantsToJson(matFilePath);
    catch ME
        warning('Failed to process %s: %s', matFiles(k).name, ME.message);
    end
end

disp('All files processed.');
