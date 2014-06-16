function [trajectories, trajectoryPoints] = loadTrajectories(fileName)
 % Load Trajectory Points
 fid = fopen(fileName);
 csvData = textscan(fid,'%s %s %f', 'delimiter',',','EmptyValue',-Inf);
 fclose(fid);

 % Trans    form points into trajectories of geostructs
 previousTrajectoryId = '';
 trajectories = {};
 trajectory = {};
 trajectoryPoints = {};

 for i = 1:length(csvData{1})
  trajectoryId = csvData{2}{i};

  if (~strcmp(previousTrajectoryId, trajectoryId) && ~isempty(trajectory))
   disp(i / length(csvData{1}) * 100)
   trajectories{end + 1} = trajectory;
   trajectory = {};
  end

  trajectoryPoint = wkt2geostruct(csvData{1}{i}, false);
  trajectoryPoint.Timestamp = csvData{3}(i);
  trajectoryPoint.TrajectoryId = trajectoryId;

  trajectory{end + 1} = trajectoryPoint;
  trajectoryPoints{end + 1} = trajectoryPoint;
  
  previousTrajectoryId = trajectoryId;
 end

 trajectories{end + 1} = trajectory;
end