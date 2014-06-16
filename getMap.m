function [image, mapRequest] = getMap(xLim, yLim)
 % Load underlying map
 serverURL = 'http://www.openbasiskaart.nl/mapcache/?SERVICE=WMS&VERSION=1.1.1&SRS=EPSG:28992';
 capabilities = wmsinfo(serverURL);

 layer = capabilities.Layer.refine('osm', 'SearchField', 'LayerName', 'MatchType', 'exact');

 % Work-around: Openbasiskaart does not provide these values by default. This causes an error in creating the WMSMapRequest
 layer.Latlim = [-90 90];
 layer.Lonlim = [-180 180];
 % Work-around: end

 % Create map request
 server = WebMapServer(layer(1).ServerURL);

 mapRequest = WMSMapRequest(layer, server);
 mapRequest.CoordRefSysCode = 'EPSG:28992';

 mapRequest.XLim = xLim;
 mapRequest.YLim = yLim;

 mapRequest.ImageWidth = 1700;
 mapRequest.ImageHeight = round(1700 * (diff(yLim) / diff(xLim)));

 image = server.getMap(mapRequest.RequestURL);
end