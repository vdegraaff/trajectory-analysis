function pois = loadPois(fileName)
 % Load Trajectory Points
 fid = fopen(fileName);
 csvData = textscan(fid,'%s %s %s %s %s %s', 'delimiter',';', 'BufSize', 32000);
 fclose(fid);

 pibArray = [];
 vosmPlusArray = [];
 poiArray = [];
 
 disp(csvData);
 
 for i = 1:length(csvData{1})
  disp(100 * i/length(csvData{1}));
  pibArray = [pibArray; loadGeostruct(csvData{4}{i}, false)];
  vosmPlusArray = [vosmPlusArray; loadGeostruct(csvData{5}{i}, false)];
  poiArray = [poiArray; loadGeostruct(csvData{6}{i}, false)];
 end
 
 nameArray = csvData{1};
 
 pois = {nameArray pibArray vosmPlusArray poiArray};
end