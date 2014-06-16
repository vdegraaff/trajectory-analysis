function [clusteredPoint] = clusterPoints(pointsToCluster)
 X = [];
 Y = [];
 
 for i=1:length(pointsToCluster)
  pointToCluster = pointsToCluster{i};
  
  X = [X; pointToCluster.X(1)];
  Y = [Y; pointToCluster.Y(1)];
 end
 
 wkt = ['POINT(' num2str(mean(X)) ' ' num2str(mean(Y)) ')'];
 
 clusteredPoint = wkt2geostruct(wkt, false);
 clusteredPoint.Timestamp = pointsToCluster{1}.Timestamp;
end