function [ imgArray ] = getImages(folderPath)
    
    list = dir(folderPath);
    imgArray = cell(1,length(list) - 2);
    for i = 3:length(list)
        imgpath = fullfile(folderPath, list(i).name);
        %disp(imgpath);
        img = imread(imgpath);
        imgArray{i-2} = img;
    end

end