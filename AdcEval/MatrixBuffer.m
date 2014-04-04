function [ AugmentedMatrix ] = MatrixBuffer( Matrix )
%Created by Abhinava Singh (abhinavasingh16@gmail.com)
%   This goes through and gets rid of the zero valued row vectors of a
%   matrix. 

MatrixSize = size(Matrix);
Columns = MatrixSize(2);
Rows = MatrixSize(1);
CopyMatrix = Matrix;
SubMatrix = zeros(Rows,Columns);
i = 1;

for Column = 1:Columns 
    Bool = ZeroColumnVectorBuffer(Matrix(:,Column));
    if strcmp(Bool,'True') == 0
        SubMatrix(:,i) = Matrix(:,Column);
        i = i+1;
    end
end

AugmentedMatrix = SubMatrix;

end

