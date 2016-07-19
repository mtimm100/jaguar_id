function [ nothing ] = saveResults(simMatrix, jagNames, imgPaths)

    N = length(jagNames);
    %for i=1:N
    for i=1:168
        %find highest 5 elements in the row
        %sort the values in that row to be descending order and take
        %the first 5 to be the top values, saving indices as well
        [sortedSimScores, sortedIndices] = sort(simMatrix(i,:), 'descend');
        
  
        h = figure(1); 
        testImg = imread(imgPaths{i});
        match1 = imread(imgPaths{sortedIndices(1)});
        match2 = imread(imgPaths{sortedIndices(2)});
        match3 = imread(imgPaths{sortedIndices(3)});
        match4 = imread(imgPaths{sortedIndices(4)});
        match5 = imread(imgPaths{sortedIndices(5)});
        

        disp(i)
        %save all the sift_line images 
        %fprintf('jagName: %s\ni: %d\nmatchNum: %d', jagNames{i}, i, 1);
        
        sift_mosaic_jaguar(testImg, match1, true, jagNames{i}, jagNames{sortedIndices(1)}, i, 1);
        sift_mosaic_jaguar(testImg, match2, true, jagNames{i}, jagNames{sortedIndices(2)}, i, 2);
        sift_mosaic_jaguar(testImg, match3, true, jagNames{i}, jagNames{sortedIndices(3)}, i, 3);
        sift_mosaic_jaguar(testImg, match4, true, jagNames{i}, jagNames{sortedIndices(4)}, i, 4);
        sift_mosaic_jaguar(testImg, match5, true, jagNames{i}, jagNames{sortedIndices(5)}, i, 5);
        
        clf;
        testImg = addborder(testImg, 15, [0 255 0], 'outer');
        
        %if it is a correct match, add a red border
        if(strcmp(jagNames{sortedIndices(1)}, jagNames{i}))
            match1 = addborder(match1, 15, [0 255 0], 'outer');
        end
        if(strcmp(jagNames{sortedIndices(2)}, jagNames{i}))
            match2 = addborder(match2, 15, [0 255 0], 'outer');
        end
        if(strcmp(jagNames{sortedIndices(3)}, jagNames{i}))
            match3 = addborder(match3, 15, [0 255 0], 'outer');
        end
        if(strcmp(jagNames{sortedIndices(4)}, jagNames{i}))
            match4 = addborder(match4, 15, [0 255 0], 'outer');
        end
        if(strcmp(jagNames{sortedIndices(5)}, jagNames{i}))
            match5 = addborder(match5, 15, [0 255 0], 'outer');
        end
        

        subplot(3,2,1), subimage(testImg);
        axis off;
        str = sprintf('Test Image: %s \nJaguar ID: %s', imgPaths{i}, jagNames{i});
        title(str,'Interpreter','none');
        
        subplot(3,2,2), subimage(match1);
        axis off;
        str = sprintf('Match 1: %s \nJaguar ID: %s\nSimilarity Score: %d', ...
            imgPaths{sortedIndices(1)}, jagNames{sortedIndices(1)}, sortedSimScores(1));
        title(str,'Interpreter','none');
        
        subplot(3,2,3), subimage(match2);
        axis off;
        str = sprintf('Match 2: %s \nJaguar ID: %s\nSimilarity Score: %d', ...
            imgPaths{sortedIndices(2)}, jagNames{sortedIndices(2)}, sortedSimScores(2));
        title(str,'Interpreter','none');
        
        subplot(3,2,4), subimage(match3);
        axis off;
        str = sprintf('Match 3: %s \nJaguar ID: %s\nSimilarity Score: %d', ...
            imgPaths{sortedIndices(3)}, jagNames{sortedIndices(3)}, sortedSimScores(3));
        title(str,'Interpreter','none');
        
        subplot(3,2,5), subimage(match4);
        axis off;
        str = sprintf('Match 4: %s \nJaguar ID: %s\nSimilarity Score: %d', ...
            imgPaths{sortedIndices(4)}, jagNames{sortedIndices(4)}, sortedSimScores(4));
        title(str,'Interpreter','none');
        
        subplot(3,2,6), subimage(match5);
        axis off;
        str = sprintf('Match 5: %s \nJaguar ID: %s\nSimilarity Score: %d', ...
            imgPaths{sortedIndices(5)}, jagNames{sortedIndices(5)}, sortedSimScores(5));
        title(str,'Interpreter','none');
        
        %str = sprintf('results/Sheila_results/collages/Jaguar_%s_image%d_matches.jpg', jagNames{i}, i);
        str = sprintf('results/collages_new/Jaguar_%s_image_%d_matches.jpg', jagNames{i}, i);
        %savefig(str);
        saveas(gcf,str);
        
        
    end
end
