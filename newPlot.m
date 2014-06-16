function newPlot(image, mapRequest, circleRadius, stayPoints, xLim, yLim) 
 % Clear figure
 clf;
 hold on;

 % Display underlying map
 mapshow(image, mapRequest.RasterRef);

 % Display clustered stay points
 stayPointsX = [];
 stayPointsY = [];

 for i = 1:length(stayPoints)
  stayPointsX(end + 1) = stayPoints{i}.X(1);
  stayPointsY(end + 1) = stayPoints{i}.Y(1);
 end

 scatter(stayPointsX, stayPointsY, 36, [0 0.5 0], 'x');
 
 % Display question locations
 questionLocations = [258190 471040; 258190 471040; 258190 471040; 258320 470950; 258550 470890; 258130 471200; 258068.631521739 471377.294369565; 258086.83 471360.8; 258144.932 471344.843; 258280 471150; 258030.34 471443.71; 257968.755 471287.2; 257646.57 471100.32; 257452.066212835 471319.095491378; 257700 471540; 258028.545 471581.25; 258396.72 471250.16; 258060.998 471396.004; 258092.99 471520.922; 258248.148 471438.937; 257889.559377914 472419.834787927; 257790.353 470852.418; 258302.16 471259.8; 258099.906 471265.527];

 for i = 1:length(questionLocations)
  plotCircle(questionLocations(i,1), questionLocations(i,2), circleRadius, 'b');
 end
 
 % Display other significant locations
 plotCircle(257140, 472090, 150, 'r'); % Park
 plotCircle(258070, 471370, 50, 'r'); % Oude Markt
 
 % Display clarification texts
 text(257010, 472280, {'\color{red}{Next program element, ', 'app still running}'});
 text(258200, 470850, {'\color{blue}{Supermarket, ', 'slower walking}'});

 % Reset image: some points are outside the Enschede area
 xlim(xLim);
 ylim(yLim);

 axis square;
end