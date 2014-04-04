function [ NewSeries ] = IntensityFilter( Series, StartSequence, EndSequence, LowLim, UpLim )
%Created by Abhinava Singh (abhinavasingh16@gmail.com)
%   Input Sequences 
%       Series          - This should be a volumetric matrix that has been created
%                         by DicomLoad. 
%       
%       StartSequence   - This is the first image of a sequence you want to
%                         filter 
%   
%       EndSequence     - This is the last image of a sequence that you
%                         want to filter 
%
%       LowLim          - This is the low intensity limit that you want
%                         everything lower to be deleted. 
%
%       UpLim           - This is the high intensity limit that you want everything higher to be filtered out 
%
%
%
%   Output Sequences 
%       NewSeries       - A new volumetric matrix with the filtered
%                         sequence. 
%
 
if StartSequence > EndSequence
    error('StartSequence cannot be bigger than the EndSequence...consider flipping')
end


if LowLim > UpLim
    error('LowLim cannot be bigger than UpLim....consider flipping')
end

for i = StartSequence:EndSequence
    PicSize = size(Series(:,:,i));      %Take the fft of the matrix 
    TotalRows = PicSize(1);
    TotalColumns = PicSize(2);
    for Row = 1:TotalRows               %Filter out inside the Frequency Domain via BandPass Filter
        for Column = 1:TotalColumns 
            if Series(Row,Column,i) >= UpLim || Series(Row,Column,i) <= LowLim
                Series(Row,Column,i) = -250;
            end
        end
    end
end

NewSeries = Series;  

end




