function [ Report ] = Main( ADC_Map )
%Designed by Abhinava Singh (abhinavasingh16@gmail.com)
%   This function semi automatically generates patient histogram data for a
%   sequence of abdominal ADC_maps. All you have to do is draw the regions
%   of interest!

%Dimension Work 

WorkingImageNo = 1;
MapSize = size(ADC_Map);
TotalImages = MapSize(3);

%Creates a sub matrix for better memory management and a smaller big theta.

dataStruct = zeros(256,TotalImages);
maxImage = [];


%Main Body of everything prompts for roi, creates mask, interpolates to
%mask, and generates raw histogram data. 

for Image = WorkingImageNo:TotalImages

    WorkingImage = ADC_Map(:,:,Image);
    imshow(WorkingImage,'DisplayRange',[])
    Mask = roipoly;
    Bool = Elem(Mask,1);
    
    if strcmp(Bool,'True') == 1  
        
        WorkingImage = double(WorkingImage);
        FinalImage = Mask .* WorkingImage;
        NormedFinalImage = FinalImage/max(FinalImage(:));
        HistImage = imhist(NormedFinalImage);
        dataStruct(:,Image) = HistImage;
        
    end

end


%augments the data allowing it to be plottable and readable. 

FixeddataStruct = ZeroZap(dataStruct);
PreReport = FixeddataStruct;
PreReport = VectorSpaceAccum(PreReport);
Report = PreReport(2:255);


end

