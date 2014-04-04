function [ ReducedMatrix ] = ZeroReduce( Matrix )
%Gets rid of the zero valued row vectors at the end of the matrix 
%   Detailed explanation goes here

MatrixSize = size(Matrix);
Columns = MatrixSize(2);
Rows = MatrixSize(1);

for Column = 1:Columns
    Bool = ZeroColumnVectorBuffer(Matrix(:,Column));
    if strcmp(Bool,'True') == 1
        PreCol = Column - 1;
        Matrix = Matrix(:,1:PreCol);
        break
    end
end

ReducedMatrix = Matrix;

end

