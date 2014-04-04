function [ HasElem ] = Elem( Image,element )
%Created by Abhinava Singh (abhinavasingh16@gmail.com)
%   Takes a matrix and determines if it has an element in its contents. 

SizeImage = size(Image);
NumRows = SizeImage(1);
NumColumns = SizeImage(2);
Bool = 'Fals';
InitialRow = 1;
InitialColumn = 1;

for Row = InitialRow:NumRows
    for Column = InitialColumn:NumColumns
        if Image(Row,Column) == element 
            Bool = 'True';
        end
    end
end

if Bool == 'True'
    HasElem = 'True';
else
    HasElem = 'Fals';
end
end  
          
