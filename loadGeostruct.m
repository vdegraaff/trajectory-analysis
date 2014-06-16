function geo = loadGeostruct(wkt, isLatLon)
 % wkt2geostruct does not support multipolygons. The next best thing is to
 % take the first polygon
 if (length(wkt) > 13 && strcmpi(wkt(1:13), 'MULTIPOLYGON'))
  wkt = strcat('polygon', wkt(14:strfind(wkt, '),')));
 end
 
 geo = wkt2geostruct(wkt, isLatLon);
end

