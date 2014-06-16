function stayPoints = detectStayPoints(trajectories, stepSize, speedThreshold, timeThreshold)
 clusteredPoints = {};
 pointsToCluster = {};
 stayPoints = {};

 for i = 1:length(trajectories)
  trajectory = trajectories{i};

  for j = stepSize + 1:length(trajectory)
   trajectoryPoint = trajectory{j};
   previousTrajectoryPoint = trajectory{j - stepSize};

   displacement = sqrt((trajectoryPoint.X(1) - previousTrajectoryPoint.X(1)).^2 + (trajectoryPoint.Y(1) - previousTrajectoryPoint.Y(1)).^2);
   timeElapsed = (trajectoryPoint.Timestamp - previousTrajectoryPoint.Timestamp);
   
   speed = (displacement / timeElapsed);

   if (timeElapsed < timeThreshold && speed < speedThreshold)
    % GPS signal was available, and speed was low

    if (isempty(pointsToCluster))
      % also include the points in the clustering that first indicated the
      % decrease in speed
      for k=j-stepSize:j-1
       pointsToCluster{end + 1} = trajectory{k};
      end
    end
     
    pointsToCluster{end + 1} = trajectoryPoint;
   else
    if (~isempty(pointsToCluster) && pointsToCluster{end}.Timestamp - pointsToCluster{1}.Timestamp > timeThreshold)
     clusteredPoint = clusterPoints(pointsToCluster);
     stayPoints{end + 1} = clusteredPoint;
    end
    
    pointsToCluster = {};
   end
  end
 end
end