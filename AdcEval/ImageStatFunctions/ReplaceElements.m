function [ NewSequence ] = ReplaceElements( MatElem,RepElem,Sequence )
%Created by Abhinava Singh (abhinavasingh16@gmail.com)
%   Replaces an element of a matrix with another element 
%   
%   Input Values - 
%       
%       RepElem                     -The element you want to replace
%                                    MatElem with. 
%       
%       MatElem                     -The element you want to replace. 
%       
%       Sequence                    -A 3D sequence of MRI images read by
%                                    DicomLoad 
%   
%   Output Values - 
%       
%       NewSequence                 -A 3D sequence of MRI images with said
%                                   values replaced. 
%



SequenceSize = size(Sequence); 
% 
% if size(SequenceSize) == 2 
% SequenceRows = SequenceSize(1);
% SequenceCols = SequenceSize(2); 
% SequenceDepth = SequenceSize(3);
% else
SequenceRows = SequenceSize(1);
SequenceCols = SequenceSize(2); 
SequenceDepth = 1;
% end


for level = 1:SequenceDepth 
    for Row = 1:SequenceRows 
        for Column = 1:SequenceCols 
            if Sequence(Row,Column,level) == MatElem 
                Sequence(Row,Column,level) = RepElem;
            end
        end
    end
end

NewSequence = Sequence;

end

