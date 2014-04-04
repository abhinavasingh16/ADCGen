function [ PositionList ] = IntensityFind( Series,StartSequence,EndSequence,KeyIntensity,Tolerance )
%Created by Abhinava Singh (abhinavasingh16@gmail.com)
%
%   This is a function that takes a sequence of DICOM's and finds the 
%   location of the spinal chord in each one. It outputs an 3D array of indices where 
%   the spine is located for every image.This is made so that we can find the 
%   relative intensities of water molecules. 
%
%   Input values 
%       ImageSequence       - A volumetric matrix of the dicom sequence.
%                             This can be found via the DicomLoad function.
%   
%       StartSequence       - The first picture of the sequence. E.G:
%                             (if 'IM-0001-0002' was your first pic, you 
%                             would put 2) 
%
%           
%       EndSequence         - The last picture of the sequence. E.G:
%                             (if 'IM-0001-0028' was your last pic, you 
%                             would put 28) 
%
InitPositionList = [];
MaxAllowed = KeyIntensity + Tolerance;
MinAllowed = KeyIntensity - Tolerance;
if StartSequence > EndSequence
    error('StartSequence cannot be bigger than the EndSequence...consider flipping')
end

for i = StartSequence:EndSequence
    PicSize = size(Series(:,:,i));
    TotalRows = PicSize(1);
    TotalColumns = PicSize(2);
    for Row = 1:TotalRows 
        for Column = 1:TotalColumns 
            if Series(Row,Column,i) <= MaxAllowed && Series(Row,Column,i) >= MinAllowed 
                InitPositionList = vertcat(InitPositionList,[Row Column]);
            end
        end
    end
    InitPositionList = vertcat(InitPositionList, [0.1 0.1]);
end

PositionList = InitPositionList;

end


