function [ FixedMatrix ] = ZeroZap( Matrix )
%Final compiled function that gets rid of zero valued row vectors. 

RearrangedMatrix = MatrixBuffer(Matrix);
FixedMatrix = ZeroReduce(RearrangedMatrix);


end

