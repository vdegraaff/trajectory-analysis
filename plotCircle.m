% Source: http://www.mathworks.nl/matlabcentral/answers/3058-plotting-circles
function plotCircle(x,y,r,c)
 ang = 0:0.01:2*pi; 
 xp = r * cos(ang);
 yp = r * sin(ang);
 plot(x+xp,y+yp,c);
end
