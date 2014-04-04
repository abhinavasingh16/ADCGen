function [ ImageMap ] = TwoPointADC( WDIS1,WDIS2,BValue2 )
%Created by Abhinava Singh(abhinavasingh16@gmail.com)
%   Ladies and Gentlemen, this is it. This is a function that takes two
%   sequences and generates an ADC Map of the Sequence. 
%
%   Input Values
%
%       WDIS1                           -This is a sequence of a weighted
%                                       diffusion image with the first BValue 
%
%
%       WDIS2                           -This is a sequence of a weighted diffusion 
%                                        image with the second BValue.
%
%       BValue1                         -This is the first BValue 
%
%       BValue2                         -This is the second BValue
%
%
%   Special Considerations 
%
%       Please ensure that the sequence matrix dimensions are the same for
%       both the WeightedDiffusionSeq and the T2WeightedSeq. Also ensure
%       that the BValue for both sequences is the same. Finally, the images
%       for each sequence should match. For example, image 1 of WDS should
%       be the same as image 1 of T2WS. I will change this in future
%       updates, when I get the time! For now, just deal with it. 

WDIS1 = double(WDIS1);
WDIS2 = double(WDIS2); 

if size(WDIS1) ~= size(WDIS2) 
    error('Weighted diffusion sequence matrix dimension is different from the T2 Weighted Sequence matrix. Please resample the data and retry. Read documentation for more information');
end

%Constructs a substitution matrix which will function as the ADC Map. Did
%this for better memory management. 

SubMatrixSize = size(WDIS1);
SubMatrixCols = SubMatrixSize(2);
SubMatrixRows = SubMatrixSize(1);
SubMatrixDepth = SubMatrixSize(3); 
SubMatrixConst = zeros(SubMatrixRows,SubMatrixCols,SubMatrixDepth);

for depth = 1:SubMatrixDepth 
    for row = 1:SubMatrixRows
        for column = 1:SubMatrixCols 
            NormalizationFactor = (1/(BValue2));
            NewPixel = WDIS2(row,column,depth);
            StandardPixel = WDIS1(row,column,depth);
            if log(NewPixel/StandardPixel) ~= -Inf && StandardPixel ~= 0 && isnan(log(NewPixel/StandardPixel)) == 0
                LogFactor = log(NewPixel/StandardPixel);
                ADCPixel = NormalizationFactor * LogFactor;
                SubMatrixConst(row,column,depth) = ADCPixel; 
            else
               SubMatrixConst(row,column,depth) = StandardPixel; 
            
            end
            
        end
    end
end

ImageMap = SubMatrixConst;

end

