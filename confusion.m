function [ confMatrix ] = confusion(simMatrix, jagNames)


    indivJags = unique(jagNames);
    countIndivJags = zeros(1, length(indivJags));
    confMatrix = zeros(length(indivJags));
  
   %get how many pictures of each jaguar there are 
    for i = 1:length(indivJags)
        for c = 1:length(jagNames)
            if(strcmp(indivJags(i),jagNames{c}))
                countIndivJags(i) = countIndivJags(i) + 1;
            end
        end
    end
    
    
    %array for correct matches for each 
    
   
    N = length(jagNames);
    row = 1;
    true = zeros(1, N);
    predictions = zeros(1, N);
    
    
    for a = 1:length(indivJags)
        for b = 1:countIndivJags(a) %goes thru one row of simMat
            highestInRow = 0;
            for c=1:N
                %find highest element in the row
                if(simMatrix(row,c) > highestInRow)
                    highestInRow = simMatrix(row,c);
                    nameOfMatch = jagNames{c};
                end
            end
            
            true(row) = a; %save true jaguar index from indivJags
            
            [blah, locOfPredicted] = ismember(nameOfMatch, indivJags);
            predictions(row) = locOfPredicted; %save the predicted jag index from indivJags
            
            row = row + 1; %increase the location to move onto next image
        end
    end
    
    for i = 1:N
       confMatrix(true(i), predictions(i)) =  confMatrix(true(i), predictions(i)) + 1;
    end
    
    for i = 1:length(indivJags)
        for j = 1:length(indivJags)
            confMatrix(i, j) = (confMatrix(i, j))/(countIndivJags(i));
        end
    end
    
    %display as color map and save
    
    figure;
    imagesc(confMatrix)
    %NumTicks = 16;
    %L = get(gca,'XLim');
    %set(gca,'XTick',linspace(L(1),L(2),NumTicks))
    %set(gca,'YTick',linspace(L(1),L(2),NumTicks))
   % xlabel('Prediction')
   % ylabel('True')
    set(gca,'xtick',[])
    set(gca,'ytick',[])
    %ax = gca;
    %set(ax,'XTickLabel',{'1','2','3','4','5','6','7','Chessie','Guapo','Johar','Maderas','Napo','Nindiri','Stewie','Tikal','Valerio'})
    %set(ax,'YTickLabel',{'1','2','3','4','5','6','7','Chessie','Guapo','Johar','Maderas','Napo','Nindiri','Stewie','Tikal','Valerio'})
    colormap gray
    colorbar
    str = sprintf('results/colormap.jpg');
        %savefig(str);
    saveas(gcf,str);
    

