function [ output ] = edge_detector( image )
%Created by Abhinava Singh (abhinavasingh16@gmail.com)
%   Input an image and output a new image in black and white with the edges
%   having outlines around it. This is a overlay mask in image processing
%   terms. 
if iscellstr(image) == 1
    I = dicomread(image);
else
    I = image;
end

[~, threshold] = edge(I, 'sobel');        %Runs My Sobel Algorithm for edge detection - and stores everything 
fudgeFactor = .5;
output = edge(I,'sobel', threshold * fudgeFactor); %Outputs a new mage with the borders highlited and everything else blackened. Pretty Awesome stuff.

end


