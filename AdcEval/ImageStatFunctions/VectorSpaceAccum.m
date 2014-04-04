function [ GaussianDistribution ] = VectorSpaceAccum( Data )
%Created by Abhinava Singh (abhinavasingh16@gmail.com)
%   Input Values
%
%       Data            - A matrix of row vectors of data to be
%                         accumulated.
%
%
%   Output Values
%
%       Guassian_Distribution   -A normal distribution of the vector space.
%       

DataSize = size(Data);
NumRows = DataSize(1);
NumCols = DataSize(2);
PlaceHolder = 0;

RepVector = zeros(NumRows,1);

for i = 1:NumRows 
    for j = 1:NumCols
        RepVector(i,1) = RepVector(i,1)+Data(i,j);
    end
end
GaussianDistribution = RepVector;
        
        



end

