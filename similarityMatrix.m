function simMatrix = similarityMatrix(imgs)
%create an NxN matrix holding the similarity values between the images
%for i->N, j->N, Sij = ?
% load i and j, use sift_mosaic, computer a #, put in i, jth spot in matrix
    
    N = (length(imgs));  
    disp(N)
    simMatrix = zeros(N);
    
    %simMatrix(3,7) = sift_mosaic(imgs{3}, imgs{7}, false);

    tic;
    parfor i=1:N
        for j=1:N
            if(i~=j)      
                fprintf('\n i = %d, j = %d',  i, j);
                simMatrix(i,j) = sift_mosaic_jaguar(imgs{i}, imgs{j}, false);
            end
        end
    end
    endTime = toc;
    disp(endTime/1000)

end