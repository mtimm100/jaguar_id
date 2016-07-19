function [imgPaths, imgs, jagNames] = fillArrays(folderPath)
%FILLARRAYS 
% imgPaths holds all the paths of the images,
% imgNames holds all the names of the images (001.jpg etc)
% jagNames holds all the names of the jaguars corresponding to the images
% at the same index in imgNames array
    
    imgPaths = {};
    imgs = {};
    jagNames = {};
    sortedJag = dir(folderPath); %pass 'data/Sorted_Jaguars'
    
    for i = 3:length(sortedJag) %go through all the jaguar folders
        subfolderPath = fullfile(folderPath, sortedJag(i).name); %subfolderPath is individ jag folder
        %disp(subfolderPath)
        indivJagPics = dir(subfolderPath);
        for j = 3:length(indivJagPics) % go through the individual jaguar folder
            imgPaths{end+1} = fullfile(subfolderPath, indivJagPics(j).name);
            %disp(imgPaths{end});
            img = imread(imgPaths{end});
            imgResized = imresize(img, [NaN 512]); 
            imgs{end+1} = imgResized;
            jagNames{end+1} = sortedJag(i).name;
        end
    end
end

