function [ output ] = DicomLoad(sequenceStartNo,sequenceEndNo,basename,fileExtension,num_rows,num_cols)
%Created by Abhinava Singh (abhinavasingh16@gmail.com)
%  Input Arguments
%     
%     file_path         =   Type the directory string of where the files
%                           are. I know this is unfortunate but its tough 
%                           otherwise. 
%     sequenceStartNo   =   Starting sequence number from the first dicom 
%                           image file to be read.
%                           (e.g xxx_0010.dcm...xxx_0500.dcm - "10" is
%                           your sequenceStartNo)
%     sequenceEndNo     =   Ending sequence number for the last dicom image
%                           file to be read. 
%                           (e.g xxx_0000.dcm...xxx_0500.dcm - "500" is
%                           your sequenceEndNo)
%     basename          =   Common name of the file sequence (e.g ATLAS_0001.dcm,
%                           ATLAS_0002.dcm,ATLAS_0003.dcm,...ATLAS_00199.dcm 
%                           has basename = 'ATLAS_')
%     fileExtension     =   extension of the image .dcm or dicom.
%       
%     
%     num_rows          =   Number of rows in the 2D matrix of your
%                           DICOM picture. To find this value read on.
%                   
%
%     num_cols          =   Number of columns in the matrix of your
%                           pictures. To find the number of columns and rows
%                           of the pic just callsize(dicomread('filename')). 
%                           The second value is the number of columns.
%
%   Output: This script loads all of the images in a single 3D cell array for
%   you to use in your image processing. Great for loading and storing a
%   bunch of images in a file at once! When you want to call a certain
%   image in the array, simply call output[:,:,whatever number you want] so for
%   example if you want image 32 you call output(:,:,32) and you have a matrix
%   of the image.
%
%   Caution: You need to ensure that the only files in dir_name are .dcm
%   and are in some sort of sequential order starting from 1.I will assume 
%   this is true because that is how Osirix uploads this information because Osirix is
%   the bee's knees.  Most importantly, do not run more than 1000 files at 
%   the same time! 


totalFiles = sequenceEndNo - sequenceStartNo;

bigarray = int16(zeros(num_rows,num_cols));

if totalFiles < 0
    error('sequenceStartNo is higher than sequenceEndNo..consider flipping ')
    return;
end

for i=sequenceStartNo:sequenceEndNo
    if i < 10
        sequenceNo = strcat('000',num2str(i));
    elseif ((10 <= i ) & (i < 100))
        sequenceNo = strcat('00',num2str(i));
    elseif ((100 <= i ) & (i <1000))
        sequenceNo = strcat('0',num2str(i));
    elseif 1000 < i
        error('More than 1000 files selected')
    end

    filename = strcat(basename,sequenceNo,fileExtension);
    index = dicomread(filename);
    bigarray(:,:,i) = index;
end

output = bigarray;
end

