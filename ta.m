% Initialize
circleRadius = 25;
clusteringStepSize = 5;
clusteringSpeedThreshold = 0.25; % in m/s
clusteringTimeThreshold = 30;

% Question Boundary Box
xLim = [257000 258700];
yLim = [470800 472500];

% Load trajectories & polygons
[trajectories, trajectoryPoints] = loadTrajectories('trajectory_points.csv');
pois = loadPois('pois.csv');

% Cluster trajectory points based on speed
stayPoints = detectStayPoints(trajectories, clusteringStepSize, clusteringSpeedThreshold, clusteringTimeThreshold);

% Create map
[image, mapRequest] = getMap(xLim, yLim);

% Display points on map
newPlot(image, mapRequest, circleRadius, stayPoints, xLim, yLim);
