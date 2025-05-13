function exportIlluminantsToJson(matFilePath)
% exportIlluminantsToJson Exports groundtruth illuminants from a .mat file into separate JSON files.
% 
%   exportIlluminantsToJson('Canon600D_gt.mat') will create
%   Canon600D_0001_metadata.json, Canon600D_0002_metadata.json, etc.
%
%   The function will save all JSON files in a folder named after the MAT file.

    % Load the .mat file
    data = load(matFilePath);

    % Check if the required field exists
    if ~isfield(data, 'groundtruth_illuminants')
        error('The .mat file does not contain the variable "groundtruth_illuminants".');
    end
    
    illuminants = data.groundtruth_illuminants;
    
    % Extract base filename
    [~, baseName, ~] = fileparts(matFilePath);
    
    % Remove '-gt' or '_gt' if present
    baseName = regexprep(baseName, '[-_]?gt$', '');

    % Output folder
    outputDir = [baseName '_jsons_metadata'];
    if ~exist(outputDir, 'dir')
        mkdir(outputDir);
    end

    % Loop through each illuminant
    for i = 1:size(illuminants, 1)
        % Prepare the structure
        illuminant_struct.illuminant_color_raw = illuminants(i, :);
        
        % Convert to JSON
        jsonText = jsonencode(illuminant_struct);
        
        % Beautify JSON
        jsonText = prettyjson(jsonText);
        
        % Define filename
        filename = sprintf('image_%04d_sensorname_%s_metadata.json',  i, baseName);
        filepath = fullfile(outputDir, filename);
        
        % Write JSON file
        fid = fopen(filepath, 'w');
        if fid == -1
            error('Cannot create JSON file: %s', filepath);
        end
        fwrite(fid, jsonText, 'char');
        fclose(fid);
    end

    fprintf('Finished exporting to folder: %s\n', outputDir);
end

function out = prettyjson(jsonText)
    % Helper function to make JSON pretty (indented)
    out = jsonencode(jsondecode(jsonText), 'PrettyPrint', true);
end
