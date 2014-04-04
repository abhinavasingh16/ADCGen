function [ HistData ] = HistDataGen( FilteredKidneys )
%Created by Abhinava Singh (abhinavasingh16@gmail.ocm)
%   Generates Histrogram data by normalizing your images and taking the
%   imhist of them and placing them in a array for analysis. 

totalSize = size(FilteredKidneys);
totalImages = totalSize(3);
totalColumns = totalSize(2);
totalRows = totalSize(1);
WorkingImageNo = 1;
dataStruct = zeros(256,totalImages);

MaxIntensity = MaxIntensityFind(FilteredKidneys);

for i = WorkingImageNo:totalImages
    WorkingImage = FilteredKidneys(:,:,i);
    NormalizedWorkingImage = WorkingImage/MaxIntensity;
    HistImage = imhist(NormalizedWorkingImage);
    dataStruct(:,i) = HistImage;
end

FixeddataStruct = ZeroZap(dataStruct);
PreReport = FixeddataStruct;
PreReport = VectorSpaceAccum(PreReport);
HistData = PreReport(2:255);

end
