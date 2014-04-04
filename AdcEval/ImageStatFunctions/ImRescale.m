function [ NewImage ] = ImRescale( Image,desiredMin,desiredMax )
%Rescales the image 

desiredRange = desiredMax - desiredMin;
NewImage = desiredRange * (double(Image) + 1) / 2 + desiredMin;


end

