function [ ParsedList ] = ListParse( List )
%Created by Abhinava Singh (abhinavasingh16@gmail.com) 
%   Input 
%       List - Input a {x} by 2 list with 0.1 0.1 as a row representing a
%       new image in the series. 
%
%   Output 
%       The function outputs a 3D matrix for each picture in the series.
%       Lots of zero's at the end of each dimension for better memory
%       management!

ParsingList = [];
RowByColumn = size(List);
Rows = RowByColumn(1);
Columns = RowByColumn(2);
count = 1;

for i = 1:Rows
    if List(i,1) == 0.1
        count = count+1;
    end
end

SubMatrix = zeros(Rows,Columns,count);
new_count = 1;
i = 1;
d = 1; 

while d ~= Rows
    if List(i,1) ~= 0.1 
        SubMatrix(i,1,new_count) = List(i,1);
        SubMatrix(i,2,new_count) = List(i,2);
        i = i+1;
        d = d+1;
    else
        new_count = new_count + 1;
        i = 1;
    end
end

ParsedList = SubMatrix; 

end



