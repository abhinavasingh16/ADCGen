function [ FilteredSequence ] = RoiFilter( ADC_Map )
%Created by Abhinava Singh(abhinavasingh16@gmail.com)
%   This is a function that finds the maximum intensity of a whole kidney. 

WorkingImageNo = 1;
MapSize = size(ADC_Map);
TotalImages = MapSize(3);
TotalColumns = MapSize(2);
TotalRows = MapSize(1);

dataStruct = zeros(TotalRows,TotalColumns,TotalImages);

for Image = WorkingImageNo:TotalImages

    WorkingImage = ADC_Map(:,:,Image);
    imshow(WorkingImage,'DisplayRange',[])
    Mask = roipoly;
    Bool = Elem(Mask,1);
    
    if strcmp(Bool,'True') == 1  
        
        WorkingImage = double(WorkingImage);
        FinalImage = Mask .* WorkingImage;
        dataStruct(:,:,Image) = FinalImage;
        
    end

end

preFilteredSequence = dataStruct; 
placeholder = [];
a = 1;

for i = WorkingImageNo:TotalImages
    MembershipTest = (preFilteredSequence(:,:,i) == zeros(TotalRows,TotalColumns));
    NewBool = Elem(MembershipTest,0);
    if strcmp(NewBool,'True')
        placeholder(:,:,a) = preFilteredSequence(:,:,i);
        a = a+1;
    end
end
        
FilteredSequence = placeholder; 

end

