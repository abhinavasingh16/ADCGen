function [ DicomSequences ] = DicomSeqWrite( DicomSeq )
%DICOMSEQWRITE Summary of this function goes here
%   Detailed explanation goes here

DicomSize = size(DicomSeq);
DicomDepth = DicomSize(3);
for i = 1:DicomDepth 
    dicomwrite(DicomSeq(:,:,i),'MAP-IM');
    


end

