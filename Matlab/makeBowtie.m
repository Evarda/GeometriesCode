function trianglePixels = makeBowtie(imageSizeX, imageSizeY, separation, bias)
%UNTITLED Summary of this function goes here

% Create a logical image of a circle with specified
% diameter, center, and image size.
% First create the image.
% imageSizeX = 1000;
% imageSizeY = 1000;

[columnsInImage, rowsInImage] = meshgrid(1:imageSizeY, 1:(imageSizeX+separation));

% Next create the circle in the image.
centerX = (imageSizeX+separation)/2;
centerY = imageSizeY/2;

width = imageSizeX;
height = imageSizeY;
% separation = 30;

shiftedcenterx = (centerX-(width+separation)/2);
miny = (centerY-height/2);
maxy = (centerY+height/2);
slope = ((height)/width);
shiftedrows = (rowsInImage-centerX);
shiftedcols = (columnsInImage-centerY);

% trianglePixels1 = ((shiftedcols <=  slope.*(shiftedrows-separation/2)) & ...
%                   (shiftedcols >= -slope.*(shiftedrows-separation/2)) & ...
%                   (shiftedrows <=  (width+separation)/2));
% trianglePixels2 = ((shiftedcols >=  slope.*(shiftedrows+separation/2)) & ...
%                   (shiftedcols <= -slope.*(shiftedrows+separation/2)) & ...
%                   (shiftedrows >= -(width+separation)/2));
%               
% trianglePixels = trianglePixels1 + trianglePixels2

trianglePixels = ((shiftedcols <=  slope.*(shiftedrows-separation/2)) & ...
                  (shiftedcols >= -slope.*(shiftedrows-separation/2)) & ...
                  (shiftedrows <=  (width+separation)/2)) | ...
                 ((shiftedcols >=  slope.*(shiftedrows+separation/2)) & ...
                  (shiftedcols <= -slope.*(shiftedrows+separation/2)) & ...
                  (shiftedrows >= -(width+separation)/2));
              
leftside = ((shiftedcols <=  slope.*(shiftedrows-separation/2)) & ...
            (shiftedcols >= -slope.*(shiftedrows-separation/2)) & ...
            (shiftedrows <=  (width+separation)/2));


             
trianglePixels = ~trianglePixels+(bias.*(~leftside));
    
              
              
%((rowsInImage - centerY).^2 ...
%    + (columnsInImage - centerX).^2 <= radius.^2) & ((rowsInImage - centerY).^2 ...
%    + (columnsInImage - centerX).^2 >= radius2.^2);

% circlePixels is a 2D "logical" array.
% Now, display it.
% image(transpose(trianglePixels)) ;
% ax = gca;
% ax.DataAspectRatio = [1 1 1];
% colormap([0 0 0; 1 1 1]);
% title('Binary image of a circle');
end

