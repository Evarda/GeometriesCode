function trianglePixels = makeBowtie(bowtieSizeX, bowtieSizeY, separation, bias, potential)
% Given a bowtie size, a gap size, and a potential bias,
% bowtieSizeY = total height  of 1 triangle
% bowtieSizeX = total width of 2 triangles
% separation  = distance between triangle tips (gap size)
% bias = height of one triangle with respect to the other
% Outputs an array of potentials

% Make and Mesh Grid of 1-triangle height by (2-triangle width + gap size)
[columnsInImage, rowsInImage] = meshgrid(1:bowtieSizeY, 1:(bowtieSizeX+separation));

% Define the Center of the Image
centerX = (bowtieSizeX+separation)/2;
centerY = bowtieSizeY/2;

% Re-define height and width
height = bowtieSizeY;
width = bowtieSizeX;

% Define important quantitites for lines
shiftedcenterx = (centerX-(width+separation)/2);
miny = (centerY-height/2);
maxy = (centerY+height/2);
slope = ((height)/width);
shiftedrows = (rowsInImage-centerX);
shiftedcols = (columnsInImage-centerY);

% Makes a Logical Array of 1's in left triangle, 0's otw
leftside  = ((shiftedcols <=  slope.*(shiftedrows-separation/2)) & ...
             (shiftedcols >= -slope.*(shiftedrows-separation/2)) & ...
             (shiftedrows <=  (width+separation)/2));

% Makes a Logical Array of 1's in right triangle, 0's otw 
rightside = ((shiftedcols >=  slope.*(shiftedrows+separation/2)) & ...
             (shiftedcols <= -slope.*(shiftedrows+separation/2)) & ...
             (shiftedrows >= -(width+separation)/2));

% Makes a Logical Array of 1's in triangles, 0's otw 
trianglePixels = leftside + rightside;

% Inverts the triangle array, making values in triangles 0
trianglePixels = ~trianglePixels;

% Scales outer potential and adds bias to Left Triangle
trianglePixels = potential*trianglePixels + bias*leftside;


% circlePixels is a 2D "logical" array.
% Now, comment/uncomment to display it.
imagesc(transpose(trianglePixels)) ;
title('Bowtie');
colorbar
end

