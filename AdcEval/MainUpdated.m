function [ DataSet ] = MainUpdated( ADC_Map )
%Created by Abhinava Singh (abhinavasingh16@gmail.com)
%   Updates main function that generates a data set via the ADC Map. 

FilteredKidneys = RoiGen(ADC_Map);
DataSet = HistDataGen(FilteredKidneys);


end

