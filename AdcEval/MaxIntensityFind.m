function [ MaxIntensity ] = MaxIntensityFind( FilteredKidneys )
%Created by Abhinava Singh(abhinavasingh16@gmail.com)
%   Finds the maximum intensity for you. 

totalSize = size(FilteredKidneys);
totalImages = totalSize(3);
totalColumns = totalSize(2);
totalRows = totalSize(1);
WorkingImageNo = 1;
LocalMaximums = [];

for i = WorkingImageNo:totalImages
    WorkingImage = FilteredKidneys(:,:,1);
    LocalMax = max(WorkingImage(:));
    LocalMaximums = horzcat(LocalMaximums,[LocalMax]);
end

MaxIntensity = max(LocalMaximums);

end

