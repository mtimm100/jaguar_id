function [ jaguarArray ] = getFolders( masterFolderPath )
%goes through the master folder (Sorted_Jaguars), creates a cell array of 
%jaguars, each jaguar having an array of pictures obtained from getImages
    
    list = dir(masterFolderPath);
    jaguarArray = cell(1, length(list)-2);
    %disp(length(jaguarArray))
    for i = 3:length(list)
        folderPath = fullfile(masterFolderPath, list(i).name);
        %disp(folderPath)
        jaguarArray{i-2} = getImages(folderPath);
        
    end

end