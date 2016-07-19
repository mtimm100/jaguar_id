%function [ acc ] = accuracy(simMatrix, jagNames)
function [ acc ] = accuracy(simMatrix, jagNames, k)
%calculate accuracy of similarity function

    sumCorrectMatches = 0; %counter for matches correctly identified 
    %acc = zeros(1,5); %create accuracy array, saving accuracies with top 1 match-top 5 matches
    N = length(jagNames); %N is number of images
    
    
    %find accuracy using majority ID in top 5 matches
    
    for i=1:N
        top5ID = {};
        top5Indices = {};
        [sortedSimScores, sortedIndices] = sort(simMatrix(i,:), 'descend');
        for(j = 1:3)
            top5Indices{j} = sortedIndices(j);
        end
        for j = 1:3
            top5ID{j} = jagNames{top5Indices{j}};
        end
        
        %map ID to number to use mode
        uniqIDs = unique(top5ID);  %get all the unique IDs
        [lia, mappedIDs] = ismember(top5ID, uniqIDs); %want the mappedIDs
        
        majorityIDmapped = mode(mappedIDs);
        %need to map the majority ID back to the jaguar's name
        majorityID = uniqIDs(majorityIDmapped);
        
        
        if(strcmp(majorityID, jagNames{i}))   %if the majority ID and ID of picture we're currently on are equal
            %add one to counter
            sumCorrectMatches = sumCorrectMatches + 1;
        end
    end
    acc = sumCorrectMatches/N; %find accuracy
    
    
    
    %find highest 5 elements in the row
    %sort the values in that row to be descending order and take
    %the first 5 to be the top values, saving indices as well
    %{
    for h=1:length(acc) %h = numTopMatches to look for
        sumCorrectMatches = 0;
        for i=1:N
            
            [sortedSimScores, sortedIndices] = sort(simMatrix(i,:), 'descend');
            
            j = 1;
            while(~(strcmp(jagNames{i}, jagNames{sortedIndices(j)})) && j <= h)
                j = j+1;
            end
            if(j <= h)
                %found a match, increase sumCorrectMatches
                sumCorrectMatches = sumCorrectMatches + 1;
            end
            
        end
        acc(h) = sumCorrectMatches/N;
    end 
    
    
    for y=1:length(acc)
        fprintf('Top %d Acc: %.4f\n', y, acc(y));
    end
    %}
end
    
    

