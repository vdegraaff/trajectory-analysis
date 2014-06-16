function visitedPoisTest(geostructPoints, pois)
 matchesVector = zeros(1, length(pois{1}));
 X = [];
 Y = [];
 
 for i = 1:length(pois{4})
  X = [X pois{4}(i).X(1)];
  Y = [Y pois{4}(i).Y(1)];
 end
 
 for i = 1:length(geostructPoints)
  x = geostructPoints{i}.X(1);
  y = geostructPoints{i}.Y(1);
  
  dist = sqrt((X - x).^2 + (Y - y).^2);
 
  nearestPoiIndex = find(dist == min(dist));
  matchesVector(nearestPoiIndex) = matchesVector(nearestPoiIndex) + 1;
 end
 
 for i = 1:length(pois{1})
  nrMatches = matchesVector(i);
  if (nrMatches > 0)
   disp([pois{1}{i} ': ' num2str(nrMatches)]);
  end
 end
end