function visitedPolygonsTest(geostructPoints, polygons)
 X = [];
 Y = [];
 
 for i = 1:length(geostructPoints)
  X(end + 1) = geostructPoints{i}.X(1);
  Y(end + 1) = geostructPoints{i}.Y(1);
 end
 
 for i = 1:length(polygons{1})
  polygon = polygons{3}(i);
  inVector = inpolygon(X, Y, polygon.X, polygon.Y);
  
  score = sum(inVector);
  
  if (score > 0)
   disp([polygons{1}{i} ': ' num2str(score)]);
   fill(polygon.X, polygon.Y, 'r');
  end
 end
end