function [ TrueDataSet ] = TrueDataSet( RowVector )
%Created by Abhinava Singh (abhinavasingh16@gmail.com). This finds the total real data set of an image 
%histogram. 

TrueADCDomain = linspace(0,1,254)';
TotalSize = size(RowVector);
TotalRows = TotalSize(1);
submatrix = [];

for i = 1:TotalRows
   Frequency = RowVector(i,1);
   copy = [];
   if Frequency ~= 0
       for a = 1:Frequency
           copy(a) = TrueADCDomain(i);
       end
       submatrix = horzcat(submatrix,copy);
   end
end

TrueDataSet = submatrix';
   
       


end

