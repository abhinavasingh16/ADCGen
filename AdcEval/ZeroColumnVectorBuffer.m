function [ Boolean ] = ZeroColumnVectorBuffer( RowVector )
%Created by Abhinava Singh(abhinavasingh16@gmail.com)
%This function iterates through a row vector and returns True if the row
%vector is nothing but zeros and returns Fals otherwise. 

MatrixSize = size(RowVector);
Rows = MatrixSize(1);
InitBoolean = 'True';
for Row = 1:Rows 
    if RowVector(Row,1) ~= 0
        InitBoolean = 'Fals';
    end
end

Boolean = InitBoolean;

end



