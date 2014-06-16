function visitedPolygonsTestWithTimeThreshold(geostructPoints, polygons, timeThreshold)
 X = [];
 Y = [];
 
 for i = 1:length(geostructPoints)
  X(end + 1) = geostructPoints{i}.X(1);
  Y(end + 1) = geostructPoints{i}.Y(1);
 end
 
 polygonVector = zeros(1, length(polygons{1}));
 
 for i = 1:length(polygons{1})
  disp(100*i/length(polygons{1}));
  
  polygon = polygons{3}(i);
  inVector = inpolygon(X, Y, polygon.X, polygon.Y);
  firstTimestamp = 0;
  counted = false;
  
  for j = 1:length(inVector)
   if (inVector(j) == 0)
    firstTimestamp = 0;
    counted = false;
    continue;
   end
   
   geostructPoint = geostructPoints{j};
   
   if (firstTimestamp == 0)
    firstTimestamp = geostructPoint.Timestamp;
    continue;
   end
   
   if (~counted && firstTimestamp > 0 && geostructPoint.Timestamp - firstTimestamp > timeThreshold)
    polygonVector(i) = polygonVector(i) + 1;
    counted = true;
   end
  end
 end
 
 for i = 1:length(polygonVector)
  score = polygonVector(i);
  
  if (score > 0)
      disp(i);
   disp([polygons{1}(i) ': ' num2str(score)]);
  end
end